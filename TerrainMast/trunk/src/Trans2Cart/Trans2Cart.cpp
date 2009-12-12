////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL$
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include <QDebug>
#include "Trans2Cart.h"
#include "gdal_priv.h"

extern int gdaltransform( int argc, char ** argv, int nCount, double *dfX, double *dfY, double *dfZ );

Trans2Cart::Trans2Cart(QObject *parent)
	: QObject(parent)
{
}

void Trans2Cart::trans2WGS84(const QString &srcfilename, const QString &mdfilename)
{
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
    
    double *dfX = new double[nXSize * nYSize];
    double *dfY = new double[nXSize * nYSize];
    double *dfZ = new double[nXSize * nYSize];
    for (int j = 0; j < nYSize; j++)
    {
	for (int i = 0; i < nXSize; i++)
	{
	    dfX[j * nXSize + i] = i;
	    dfY[j * nXSize + i] = j;
	}

    }

    poBand->RasterIO( GF_Read, 0, 0, nXSize, nYSize, 
		      dfZ, nXSize, nYSize, GDT_Float64, 
		      0, 0 );

    GDALClose(poDataset);
    GDALDestroyDriverManager();
    QByteArray fname = srcfilename.toAscii();
    char *argvSet[4];
    argvSet[0] = "gdaltransform";
    argvSet[1] = "-t_srs";
    argvSet[2] = "WGS84";
    argvSet[3] = fname.data();
    qDebug() << gdaltransform(4, argvSet,
	    nXSize * nYSize, dfX, dfY, dfZ);
    qDebug() << dfX[1] << dfY[1] << dfZ[1];
    delete[] dfX, dfY, dfZ;

}

Trans2Cart::~Trans2Cart()
{

}

