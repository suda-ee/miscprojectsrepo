////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL$
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include <QDebug>
#include <QVarLengthArray>
#include "Trans2Cart.h"
#include "gdal_priv.h"

Trans2Cart::Trans2Cart(QObject *parent)
	: QObject(parent)
{
    transprocGeo = new QProcess(this);
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
    // Make sure the unit is meter todo:
    QString unitName = QString::fromAscii(poBand->GetUnitType());

    int        nXBlocks, nYBlocks, nXBlockSize, nYBlockSize;
    int        iXBlock, iYBlock;

    poBand->GetBlockSize( &nXBlockSize, &nYBlockSize );
    // nXSize = 10; // for test
    // nYSize = 3;
    nXBlocks = (nXSize + nXBlockSize - 1) / nXBlockSize;
    nYBlocks = (nYSize + nYBlockSize - 1) / nYBlockSize;

    GByte *pafData;
    pafData = (GByte *) CPLMalloc(GDALGetDataTypeSize(poBand->GetRasterDataType())*nXBlockSize * nYBlockSize);

    QString procInput;
    QStringList arguments;
    arguments << "-t_srs" << "WGS84" << srcfilename;
    transprocGeo->setStandardOutputFile(mdfilename);
    transprocGeo->start("gdaltransform", arguments);

    /* this isn't the fastest way to do this, but is easier for now */
    const char* pszPixelType = poBand->GetMetadataItem("PIXELTYPE", "IMAGE_STRUCTURE");
    int bSignedByte = (pszPixelType != NULL && EQUAL(pszPixelType, "SIGNEDBYTE"));
    for( iYBlock = 0; iYBlock < nYBlocks; iYBlock++ )
    {
        for( iXBlock = 0; iXBlock < nXBlocks; iXBlock++ )
        {
            int        nXValid, nYValid;
	    double dfValue = 0.0;
            
            poBand->ReadBlock( iXBlock, iYBlock, pafData );

            // Compute the portion of the block that is valid
            // for partial edge blocks.
            if( (iXBlock+1) * nXBlockSize > nXSize )
                nXValid = nXSize - iXBlock * nXBlockSize;
            else
                nXValid = nXBlockSize;

            if( (iYBlock+1) * nYBlockSize > nYSize )
                nYValid = nYSize - iYBlock * nYBlockSize;
            else
                nYValid = nYBlockSize;

            // processing now
            for( int iY = 0; iY < nYValid; iY++ )
            {
                for( int iX = 0; iX < nXValid; iX++ )
                {
		    //
		    int iOffset;
		    iOffset = iY * nXBlockSize + iX;
                    switch( poBand->GetRasterDataType() )
                    {
			case GDT_Byte:
			{
			    if (bSignedByte)
				dfValue = ((signed char *) pafData)[iOffset];
			    else
				dfValue = ((GByte *) pafData)[iOffset];
			    break;
			}
			case GDT_UInt16:
			    dfValue = ((GUInt16 *) pafData)[iOffset];
			    break;
			case GDT_Int16:
			    dfValue = ((GInt16 *) pafData)[iOffset];
			    break;
			case GDT_UInt32:
			    dfValue = ((GUInt32 *) pafData)[iOffset];
			    break;
			case GDT_Int32:
			    dfValue = ((GInt32 *) pafData)[iOffset];
			    break;
			case GDT_Float32:
			    dfValue = ((float *) pafData)[iOffset];
			    break;
			case GDT_Float64:
			    dfValue = ((double *) pafData)[iOffset];
			    break;
			default:
			    CPLAssert( FALSE );
		    }
		    //if (dfValue != noData)
		    {
			transprocGeo->write(QString("%1 %2 %3\n")
				.arg(iXBlock * nXBlockSize + iX)
				.arg(iYBlock * nYBlockSize + iY)
				.arg(dfValue * scale + offset)
				.toAscii());
		    }
                }
            }
        }
    }


    free(pafData);
    GDALClose(poDataset);
    transprocGeo->closeWriteChannel();
    transprocGeo->waitForFinished(-1);

}

Trans2Cart::~Trans2Cart()
{

}
