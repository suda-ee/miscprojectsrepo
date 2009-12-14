////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL: svn://land.rf/projects/TerrainMast/trunk/src/Trans2Cart/Trans2Cart.cpp $
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include "Trans2Cart.h"
#include <QProcessEnvironment>
#include "gdal_priv.h"
#include <QDebug>
#include <QFile>
#include <QTime>
#include <QApplication>
#include "GeographicLib/LocalCartesian.hpp"

extern int gdaltransform( int argc, char ** argv, int nCount, double *dfX, double *dfY, double *dfZ );

Trans2Cart::Trans2Cart(QObject *parent)
	: QObject(parent)
{
}

void Trans2Cart::trans2WGS84(const QString &srcfilename)
{
    // test if GDAL_DATA environment variable exist
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    QString gdalDatadir = qApp->applicationDirPath() + "/gdal-data";
    if (env.value("GDAL_DATA").isEmpty())
	CPLSetConfigOption("GDAL_DATA", gdalDatadir.toLocal8Bit().data());
    // Opening the File
    GDALDataset  *poDataset;
    GDALAllRegister();
    poDataset = (GDALDataset *) GDALOpen( srcfilename.toAscii().constData(),
	   GA_ReadOnly );
    // Getting Dataset Information
    double        adfGeoTransform[6];
    poDataset->GetGeoTransform( adfGeoTransform );
    // Fetching a Raster Band
    GDALRasterBand  *poBand;
    int             bGotMin, bGotMax;
    double          adfMinMax[2];
    
    // default to read 1st band
    poBand = poDataset->GetRasterBand( 1 );

    adfMinMax[0] = poBand->GetMinimum( &bGotMin );
    adfMinMax[1] = poBand->GetMaximum( &bGotMax );
    if( ! (bGotMin && bGotMax) )
        GDALComputeRasterMinMax((GDALRasterBandH)poBand, TRUE, adfMinMax);
    // Reading Raster Data
    int   nXSize = poBand->GetXSize();
    int   nYSize = poBand->GetYSize();
    //
    //
    int pbSuccess = 0;
    double noData = poBand->GetNoDataValue(&pbSuccess);
    if (!pbSuccess)
    {
	qDebug() << "There is not a NoData value.";
	// set noData to Min. Very Ugly. Do change it!
	noData = adfMinMax[0];
    }
    double scale = poBand->GetScale(&pbSuccess);
    double offset = poBand->GetOffset(&pbSuccess);
    // Make sure the unit is meter todo: !
    QString unitName = QString::fromAscii(poBand->GetUnitType());
    
    double *dfOZ = new double[nXSize * nYSize];

    emit progressMsg(tr("Prepare Data Reading..."));
    emit progressNum(0);

    poBand->RasterIO( GF_Read, 0, 0, nXSize, nYSize, 
		      dfOZ, nXSize, nYSize, GDT_Float64, 
		      0, 0 );
    
    emit progressMsg(tr("Data Readed."));
    emit progressNum(100);

    dfX = new double[nXSize * nYSize];
    dfY = new double[nXSize * nYSize];
    dfZ = new double[nXSize * nYSize];
    nCountValidPoint = 0;

    emit progressMsg(tr("Transforming Data to WGS84..."));

    for (int j = 0; j < nYSize; j++)
    {
	for (int i = 0; i < nXSize; i++)
	{
	    if (dfOZ[j * nXSize + i] != noData)
	    {
		dfX[nCountValidPoint] = i;
		dfY[nCountValidPoint] = j;
		dfZ[nCountValidPoint] = dfOZ[j * nXSize + i] * scale + offset;
		nCountValidPoint++;
	    }
	}
	emit progressNum(50.0 * j / nYSize);

    }
    delete[] dfOZ;

    GDALClose(poDataset);
    GDALDestroyDriverManager();
    QByteArray fname = srcfilename.toAscii();
    char *argvSet[4];
    argvSet[0] = "gdaltransform";
    argvSet[1] = "-t_srs";
    argvSet[2] = "WGS84";
    argvSet[3] = fname.data();
    gdaltransform(4, argvSet, nCountValidPoint, dfX, dfY, dfZ);

    emit progressNum(100);
}

void Trans2Cart::transDEM2Cartesian(const QString &srcfilename, const QString &destFilename,
	double OriLong, double OriLat, double OriZ)
{
    trans2WGS84(srcfilename);

    emit progressMsg(tr("Transforming Data to local Cartesian coordinates..."));
    emit progressNum(0);

    const GeographicLib::LocalCartesian lc(OriLat, OriLong, OriZ);
    
    double x, y, z;
    for (int i = 0; i < nCountValidPoint; i++)
    {
	lc.Forward(dfY[i], dfX[i], dfZ[i], x, y, z);
	dfX[i] = x;
	dfY[i] = y;
	dfZ[i] = z;
    }
    emit progressNum(100);
    // write out file
    // is it possible a more efficient method?
    QFile data(destFilename);
    if (data.open(QFile::WriteOnly | QFile::Truncate))
    {
	emit progressMsg(tr("Writting final data to file..."));

	QTextStream out(&data);
	out.setRealNumberPrecision(10);
	// writting file headers
	out << "#TERRAIN\n";
	out << "#STEPS     10.000000     10.000000\n";
	out << "#LONGITUDES     0     0\n";
	out << "#LATITUDES     0     0\n";
	out << "#ZONES     0     0\n";
	out << "#RAWSTEPX     0.000000\n";
	for (int i = 0; i < nCountValidPoint; i++)
	{
	    out << dfX[i] << " " << dfY[i] << " " << dfZ[i] << "\n";
	    if (i % (nCountValidPoint / 100) == 0)
	    {
		emit progressNum(100. * i / nCountValidPoint + 1);
	    }
	}
	data.close();
	emit progressMsg(tr("All finished."));
    }
}

Trans2Cart::~Trans2Cart()
{
    delete[] dfX, dfY, dfZ;
}
