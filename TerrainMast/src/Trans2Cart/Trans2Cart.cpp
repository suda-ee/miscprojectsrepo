////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL$
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include <QDebug>
#include <QVarLengthArray>
#include <QProcess>
#include "Trans2Cart.h"
#include "gdal_priv.h"

Trans2Cart::Trans2Cart(QObject *parent)
	: QObject(parent)
{
}

QByteArray Trans2Cart::trans2WGS84(const QString &filename)
{
    // Opening the File
    GDALDataset  *poDataset;
    GDALAllRegister();
    poDataset = (GDALDataset *) GDALOpen( filename.toAscii().constData(),
	   GA_ReadOnly );
    // Getting Dataset Information
    double        adfGeoTransform[6];
    poDataset->GetGeoTransform( adfGeoTransform );
    // Fetching a Raster Band
    GDALRasterBand  *poBand;
    int             nBlockXSize, nBlockYSize;
    int             bGotMin, bGotMax;
    double          adfMinMax[2];
    
    poBand = poDataset->GetRasterBand( 1 );
    poBand->GetBlockSize( &nBlockXSize, &nBlockYSize );
    adfMinMax[0] = poBand->GetMinimum( &bGotMin );
    adfMinMax[1] = poBand->GetMaximum( &bGotMax );
    if( ! (bGotMin && bGotMax) )
        GDALComputeRasterMinMax((GDALRasterBandH)poBand, TRUE, adfMinMax);
    // Reading Raster Data
    double *pafScanline;
    int   nXSize = poBand->GetXSize();
    int   nYSize = poBand->GetYSize();
    //
    //
    pafScanline = (double *) CPLMalloc(sizeof(double)*nXSize*nYSize);
    poBand->RasterIO( GF_Read, 0, 0, nXSize, nYSize, 
		      pafScanline, nXSize, nYSize, GDT_Float64, 
		      0, 0 );
    int pbSuccess = 0;
    double noData = poBand->GetNoDataValue(&pbSuccess);
    if (!pbSuccess)
    {
	qDebug() << "There is not a NoData value.";
	// set noData to Min. Very Ugly. Do change it!
	noData = adfMinMax[0];
    }
    QVarLengthArray<double> dfX;
    QVarLengthArray<double> dfY;
    QVarLengthArray<double> dfZ;
    int i, j;
    double scale = poBand->GetScale(&pbSuccess);
    double offset = poBand->GetOffset(&pbSuccess);
    // Make sure the unit is meter
    QString unitName = QString::fromAscii(poBand->GetUnitType());

    for (j = 0; j < nYSize; j++)
    {
	for (i = 0; i < nXSize; i++)
	{
	    if (pafScanline[j * nXSize + i] != noData)
	    {
		dfX.append(i);
		dfY.append(j);
		dfZ.append(pafScanline[j * nXSize + i] * scale + offset);
	    }
	}
    }
    free(pafScanline);
    GDALClose(poDataset);
    QProcess transproc(this);
    QString procInput;
    for (i = 0; i < dfZ.size(); i++)
    {
	procInput.append(QString("%1 %2 %3\n").arg(dfX[i]).arg(dfY[i]).arg(dfZ[i]));
    }
    QStringList arguments;
    arguments << "-t_srs" << "WGS84" << filename;
    
    transproc.start("gdaltransform", arguments);
    transproc.write(procInput.toAscii());
    transproc.closeWriteChannel();
    transproc.waitForFinished();
    return transproc.readAllStandardOutput();

}

Trans2Cart::~Trans2Cart()
{

}
