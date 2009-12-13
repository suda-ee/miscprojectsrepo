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

extern int gdaltransform( int argc, char ** argv, int nCount, double *dfX, double *dfY, double *dfZ );

Trans2Cart::Trans2Cart(QObject *parent)
	: QObject(parent)
{
}

void Trans2Cart::trans2WGS84(const QString &srcfilename, const QString &mdfilename)
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
    poBand->RasterIO( GF_Read, 0, 0, nXSize, nYSize, 
		      dfOZ, nXSize, nYSize, GDT_Float64, 
		      0, 0 );
    
    double *dfX = new double[nXSize * nYSize];
    double *dfY = new double[nXSize * nYSize];
    double *dfZ = new double[nXSize * nYSize];
    int nCountValidPoint = 0;
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
    // write out file
    // is it possible a more efficient method?
    qDebug() << "to file";
    qDebug() << QTime::currentTime();
    QFile data(mdfilename);
    if (data.open(QFile::WriteOnly | QFile::Truncate))
    {
	QTextStream out(&data);
	out.setRealNumberPrecision(10);
	for (int i = 0; i < nCountValidPoint; i++)
	    out << dfX[i] << " " << dfY[i] << " " << dfZ[i] << "\n";
	data.close();
    }
    
    delete[] dfX, dfY, dfZ;

}
