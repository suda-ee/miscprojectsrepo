////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include "Trans2Cart.h"
#include <QProcessEnvironment>
#include "gdal_priv.h"
#include "gdal_alg.h"
#include "ogr_spatialref.h"
#include <QDebug>
#include <QFile>
#include <QTime>
#include <QApplication>
#include <QFileInfo>
#include "GeographicLib/LocalCartesian.hpp"
#include <boost/numeric/conversion/converter.hpp>

extern int gdaltransform( int argc, char ** argv, int nCount, double *dfX, double *dfY, double *dfZ );

Trans2Cart::Trans2Cart(QObject *parent)
        : QObject(parent), m_domains()
{
}

void Trans2Cart::trans2WGS84(const QString &srcfilename, int topLeftPixel, int topLeftLine, int width, int height)
{
    // test if GDAL_DATA environment variable exist
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    QString gdalDatadir = qApp->applicationDirPath() + "/gdal-data";
    if (env.value("GDAL_DATA").isEmpty())
        CPLSetConfigOption("GDAL_DATA", gdalDatadir.toLocal8Bit().data());
    GDALAllRegister();
    // Opening the File
    try
    {
        QFileInfo fileinfo(srcfilename);
        if (!fileinfo.exists())
            throw srcfilename;

        GDALDataset  *poDataset;
        poDataset = (GDALDataset *) GDALOpen( srcfilename.toAscii().constData(),
               GA_ReadOnly );
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
        //
        int pbSuccess = 0;
        double noData = poBand->GetNoDataValue(&pbSuccess);
        if (!pbSuccess)
        {
            qDebug() << "There is not a NoData value.";
        }
        double scale = poBand->GetScale(&pbSuccess);
        double offset = poBand->GetOffset(&pbSuccess);
        // Make sure the unit is meter todo: !
        QString unitName = QString::fromAscii(poBand->GetUnitType());
        
        double *dfOZ = new double[width * height];

        emit progressMsg(tr("Prepare Data Reading..."));
        emit progressNum(0);

        poBand->RasterIO( GF_Read, topLeftPixel, topLeftLine, width, height, 
                          dfOZ, width, height, GDT_Float64, 
                          0, 0 );
        
        emit progressMsg(tr("Data Readed."));
        emit progressNum(100);

        dfX = new double[width * height];
        dfY = new double[width * height];
        dfZ = new double[width * height];
        nCountValidPoint = 0;
        emit progressMsg(tr("Transforming Data to WGS84..."));

        for (int j = 0; j < height; j++)
        {
            for (int i = 0; i < width; i++)
            {
                if (dfOZ[j * width + i] != noData)
                {
                    dfX[nCountValidPoint] = i + topLeftPixel;
                    dfY[nCountValidPoint] = j + topLeftLine;
                    dfZ[nCountValidPoint] = dfOZ[j * width + i] * scale + offset;
                    nCountValidPoint++;
                }
            }
            emit progressNum(50.0 * j / height);

        }
        delete[] dfOZ;
        GDALClose(poDataset);

        QByteArray fname = srcfilename.toAscii();
        char *argvSet[4];
        argvSet[0] = "gdaltransform";
        argvSet[1] = "-t_srs";
        argvSet[2] = "WGS84";
        argvSet[3] = fname.data();
        gdaltransform(4, argvSet, nCountValidPoint, dfX, dfY, dfZ);

        emit progressNum(100);
        GDALDestroyDriverManager();
    }
    catch (QString &filename)
    {
        emit progressMsg(QString(tr("Error: missing file %1")).arg(filename));
        qCritical()<<"Error: missing file"<<filename;
        throw;
    }
}

void Trans2Cart::transSingleDomain2Cartesian(const QString &srcfilename,
        QTextStream &out, int topLeftPixel, int topLeftLine, int width,
        int height)
{
    try
    {
        trans2WGS84(srcfilename, topLeftPixel, topLeftLine, width, height);

        emit progressMsg(tr(
                    "Transforming Data to local Cartesian coordinates..."));
        emit progressNum(0);

        const GeographicLib::LocalCartesian lc(m_OriLat, m_OriLong, m_OriZ);
        
        double x, y, z;
        for (int i = 0; i < nCountValidPoint; i++)
        {
            lc.Forward(dfY[i], dfX[i], dfZ[i], x, y, z);
            out << x << " " << y << " " << z << "\n";
            if ((100 * (i + 1) / nCountValidPoint) % 2 == 0)
            {
                emit progressNum(100. * (i + 1) / nCountValidPoint);
            }
        }
    }
    catch (...)
    {
        qCritical()<<"Exception catched!";
    }

    delete[] dfX, dfY, dfZ;
}

/**
 * @brief  
 * @param  
 * @return 
 *
 * This must be called after initiate.
 */
void Trans2Cart::transDEM2Terrain(const QString &destFilename, double OriLong,
               double OriLat, double OriZ)
{
    m_OriLong = OriLong;
    m_OriLat = OriLat;
    m_OriZ = OriZ;
    /// writing header
    QFile data(destFilename);
    if (data.open(QFile::WriteOnly | QFile::Truncate))
    {
        QTextStream out(&data);
        out.setRealNumberPrecision(10);
        double resX, resY;
        getResSize(m_domains.at(0).filename, resX, resY);
        // writing file headers
        out << "#TERRAIN\n";
        out << "#STEPS " << resX << " " << resY << "\n";
        out << "#LONGITUDES     0     0\n";
        out << "#LATITUDES     0     0\n";
        out << "#ZONES     0     0\n";
        out << "#RAWSTEPX     0.000000\n";
    
        /// for loop to trans2Cart
        for (int i = 0; i < m_domains.count(); i++)
        {
            qDebug()<<"Reading block #"<<i;
            qDebug()<<"src file name:"<<m_domains.at(i).filename;
            qDebug()<<"block info:"<<m_domains.at(i).topLeftPixel
                <<m_domains.at(i).topLeftLine<<m_domains.at(i).width
                <<m_domains.at(i).height;

            transSingleDomain2Cartesian(m_domains.at(i).filename, out, 
                    m_domains.at(i).topLeftPixel, m_domains.at(i).topLeftLine,
                    m_domains.at(i).width, m_domains.at(i).height);

        }
    /// 
        data.close();
        emit progressMsg(tr("All finished."));
    }
}

/**
 * @brief  
 * @param  cutWidth
 * @param  cutHeight
 *
 * cutWidth, cutHeight is in meters.
 *
 * @return 
 */
void Trans2Cart::initSingleFileTrans(const QString &srcfilename, double cutCenterLong,
        double cutCenterLat, double cutWidth, double cutHeight, bool cutFlag)
{
    // test if GDAL_DATA environment variable exist
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    QString gdalDatadir = qApp->applicationDirPath() + "/gdal-data";
    if (env.value("GDAL_DATA").isEmpty())
        CPLSetConfigOption("GDAL_DATA", gdalDatadir.toLocal8Bit().data());
    GDALAllRegister();
    tSrcInfo srcinfo;
    srcinfo.filename = srcfilename;
    
    double x, y, z;  ///< @brief x, y, z temp use only
    const GeographicLib::LocalCartesian lc(cutCenterLat, cutCenterLong, 0.);

    QByteArray fname = srcfilename.toAscii();
    char *argvSet[5];
    argvSet[0] = "gdaltransform";
    argvSet[1] = "-i";
    argvSet[2] = "-t_srs";
    argvSet[3] = "WGS84";
    argvSet[4] = fname.data();

    // Opening the File
    GDALDataset  *poDataset;
    GDALAllRegister();
    poDataset = (GDALDataset *) GDALOpen( srcfilename.toAscii().constData(),
           GA_ReadOnly );
    // Fetching a Raster Band
    GDALRasterBand  *poBand;
    
    // default to read 1st band
    poBand = poDataset->GetRasterBand( 1 );

    // Reading Raster Data
    int   nXSize = poBand->GetXSize();
    int   nYSize = poBand->GetYSize();

    if (cutFlag)
    {
        /** Here x, y for Long, Lat */
        lc.Reverse(-cutWidth/2., cutHeight/2., 0., y, x, z);

        gdaltransform(5, argvSet, 1, &x, &y, &z);

        /** now x, y are pixel/line value */
        srcinfo.topLeftPixel = x > 0 ? (int) x : 0;
        srcinfo.topLeftLine = y > 0 ? (int) y : 0;
        /** Here x, y for Long, Lat */
        lc.Reverse(cutWidth/2., -cutHeight/2., 0., y, x, z);

        gdaltransform(5, argvSet, 1, &x, &y, &z);

        srcinfo.width = (x < nXSize - 1 ? (int) x : nXSize - 1)
            - srcinfo.topLeftPixel + 1;
        srcinfo.height = (y < nYSize - 1 ? (int) y : nYSize - 1)
            - srcinfo.topLeftLine + 1;
    }
    else
    {
        srcinfo.topLeftPixel = 0;
        srcinfo.topLeftLine = 0;
        srcinfo.width = nXSize;
        srcinfo.height = nYSize;
    }

    m_domains.append(srcinfo);
    GDALClose(poDataset);
    GDALDestroyDriverManager();
}

double Trans2Cart::getDimensionInMeters(const QString &srcfilename, const QString &flagLongLat)
{
    // test if GDAL_DATA environment variable exist
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    QString gdalDatadir = qApp->applicationDirPath() + "/gdal-data";
    if (env.value("GDAL_DATA").isEmpty())
        CPLSetConfigOption("GDAL_DATA", gdalDatadir.toLocal8Bit().data());
    GDALAllRegister();
    // Opening the File
    GDALDataset  *poDataset;
    poDataset = (GDALDataset *) GDALOpen( srcfilename.toAscii().constData(),
           GA_ReadOnly );
    // Fetching a Raster Band
    GDALRasterBand  *poBand;
    
    // default to read 1st band
    poBand = poDataset->GetRasterBand( 1 );
    //
    // Reading Raster Data
    int   nXSize = poBand->GetXSize();
    int   nYSize = poBand->GetYSize();

    GDALClose(poDataset);

    QByteArray fname = srcfilename.toAscii();
    char *argvSet[4];
    argvSet[0] = "gdaltransform";
    argvSet[1] = "-t_srs";
    argvSet[2] = "WGS84";
    argvSet[3] = fname.data();
    double x, y, z, xlong, ylat, zheight;
    xlong = 0.; ylat = 0.; zheight = 0.;
    gdaltransform(4, argvSet, 1, &xlong, &ylat, &zheight);

    const GeographicLib::LocalCartesian lc(ylat, xlong, 0.);
    lc.Forward(ylat, xlong, zheight, x, y, z);

    xlong = nXSize - 1.; ylat = nYSize - 1.;
    gdaltransform(4, argvSet, 1, &xlong, &ylat, &zheight);

    double xLR, yLR, zLR;
    lc.Forward(ylat, xlong, zheight, xLR, yLR, zLR);

    GDALDestroyDriverManager();

    if (flagLongLat.startsWith("Long", Qt::CaseInsensitive))
        return xLR - x;
    else if (flagLongLat.startsWith("Lat", Qt::CaseInsensitive))
        return y - yLR;
    else
        return -1.;
}

/**
 * @brief  
 * @param  double &resX: X resolution, used as output
 *         double &resY: Y resolution, used as output
 * @return 0 if success
 */
int Trans2Cart::getResSize(const QString &srcfilename, double &resX, double &resY)
{

    OGRSpatialReference oSRS;
    char *pszSRS;
    char              **papszTO = NULL;
    void               *hTransformArg;
    QByteArray srcFilenameByte = srcfilename.toLocal8Bit();
    char *pszSrcFilename = srcFilenameByte.data();
    GDALAllRegister();
    oSRS.importFromEPSGA(54032);
    oSRS.SetProjParm("Central_Meridian", m_OriLong);
    oSRS.SetProjParm("Latitude_Of_Origin", m_OriLat);
    oSRS.exportToWkt(&pszSRS);

    papszTO = CSLSetNameValue( papszTO, "DST_SRS", pszSRS );
    CPLFree( pszSRS );
/* -------------------------------------------------------------------- */
/*      Open src and destination file, if appropriate.                  */
/* -------------------------------------------------------------------- */
    GDALDatasetH hSrcDS = NULL, hDstDS = NULL;

    if( pszSrcFilename != NULL )
    {
        hSrcDS = GDALOpen( pszSrcFilename, GA_ReadOnly );
        if( hSrcDS == NULL )
            exit( 1 );
    }

/* -------------------------------------------------------------------- */
/*      Create a transformation object from the source to               */
/*      destination coordinate system.                                  */
/* -------------------------------------------------------------------- */
    hTransformArg = 
        GDALCreateGenImgProjTransformer2( hSrcDS, hDstDS, papszTO );

    CSLDestroy( papszTO );

    if( hTransformArg == NULL )
    {
        exit( 1 );
    }

    double adfThisGeoTransform[6];
    int    nThisPixels, nThisLines;
    GDALSuggestedWarpOutput(hSrcDS, GDALGenImgProjTransform, hTransformArg,
            adfThisGeoTransform, &nThisPixels, &nThisLines);
    resX = adfThisGeoTransform[1];
    resY = ABS(adfThisGeoTransform[5]);
    GDALDestroyGenImgProjTransformer(hTransformArg);

    if (hSrcDS)
        GDALClose(hSrcDS);

    if (hDstDS)
        GDALClose(hDstDS);

    GDALDestroyDriverManager();

    return 0;
    
}

/**
 * @brief  
 * @param  
 * @return 
 */
bool Trans2Cart::initSRTMTrans(const QString &srcDirName, double cutCenterLong,
        double cutCenterLat, double cutWidth, double cutHeight)
{
    // test if GDAL_DATA environment variable exist
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    QString gdalDatadir = qApp->applicationDirPath() + "/gdal-data";
    if (env.value("GDAL_DATA").isEmpty())
        CPLSetConfigOption("GDAL_DATA", gdalDatadir.toLocal8Bit().data());
    GDALAllRegister();
    tSrcInfo srcinfo;
    
    double x, y, z;  ///< @brief x, y, z temp use only
    const GeographicLib::LocalCartesian lc(cutCenterLat, cutCenterLong, 0.);

    // Get the Long & Lat of the up left corner
    /** Here x, y for Long, Lat */
    lc.Reverse(-cutWidth/2., cutHeight/2., 0., y, x, z);

    // now get the first file name
    using namespace boost::numeric;
    typedef converter<int,double,conversion_traits<int,double>,
            def_overflow_handler, Ceil<double>> HZceil;
    int TileIdxX = HZceil::convert((x + 180) / 5.);
    int TileIdxY = HZceil::convert((60 - y) / 5.);
    qDebug()<<"Info: The Tile Index of the up-left corner in SRTM are:"
        <<TileIdxX << TileIdxY;
    QString srcFileName = srcDirName
        + QString("/srtm_%1_%2.tif")
        .arg(TileIdxX, 2, 10, QLatin1Char('0'))
        .arg(TileIdxY, 2, 10, QLatin1Char('0'));
    QByteArray fname = srcFileName.toAscii();
    char *argvSet[5];
    argvSet[0] = "gdaltransform";
    argvSet[1] = "-i";
    argvSet[2] = "-t_srs";
    argvSet[3] = "WGS84";
    argvSet[4] = fname.data();

    int   nXSize, nYSize;

    // Opening the File
    try
    {
        QFileInfo fileinfo(srcFileName);
        if (!fileinfo.exists())
            throw srcFileName;

        GDALDataset  *poDataset;
        GDALAllRegister();
        poDataset = (GDALDataset *) GDALOpen( srcFileName.toAscii().constData(),
               GA_ReadOnly );
        // Fetching a Raster Band
        GDALRasterBand  *poBand;
        
        // default to read 1st band
        poBand = poDataset->GetRasterBand( 1 );

        // Reading Raster Data
        nXSize = poBand->GetXSize();
        nYSize = poBand->GetYSize();

        GDALClose(poDataset);

        gdaltransform(5, argvSet, 1, &x, &y, &z);

        /** now x, y are pixel/line value */
        srcinfo.filename = srcFileName;
        srcinfo.topLeftPixel = x > 0 ? (int) x : 0;
        srcinfo.topLeftLine = y > 0 ? (int) y : 0;
        /** Here x, y for Long, Lat */
        lc.Reverse(cutWidth/2., -cutHeight/2., 0., y, x, z);

        gdaltransform(5, argvSet, 1, &x, &y, &z);

        srcinfo.width = (x < nXSize - 1 ? (int) x : nXSize - 1)
            - srcinfo.topLeftPixel + 1;
        srcinfo.height = (y < nYSize - 1 ? (int) y : nYSize - 1)
            - srcinfo.topLeftLine + 1;

        m_domains.append(srcinfo);
        
        // 2 Tiles xx
        if (x > nXSize)
        {
            // ur
            srcinfo.filename = srcDirName + QString("/srtm_%1_%2.tif")
                .arg(TileIdxX + 1, 2, 10, QLatin1Char('0'))
                .arg(TileIdxY, 2, 10, QLatin1Char('0'));
            srcinfo.topLeftPixel = 0;
            srcinfo.topLeftLine = m_domains.at(0).topLeftLine;
            srcinfo.width = (int) x - nXSize + 1;
            srcinfo.height = (y < nYSize - 1 ? (int) y : nYSize - 1)
                - srcinfo.topLeftLine + 1;
            m_domains.append(srcinfo);
            // dr
            if (y > nYSize)
            {
                srcinfo.filename = srcDirName + QString("/srtm_%1_%2.tif")
                    .arg(TileIdxX + 1, 2, 10, QLatin1Char('0'))
                    .arg(TileIdxY + 1, 2, 10, QLatin1Char('0'));
                srcinfo.topLeftPixel = 0;
                srcinfo.topLeftLine = 0;
                srcinfo.width = (int) x - nXSize + 1;
                srcinfo.height = (int) y - nYSize + 1;
                m_domains.append(srcinfo);
            }
        }
        // 2 Tiles yy, dl
        if (y > nYSize)
        {
            srcinfo.filename = srcDirName + QString("/srtm_%1_%2.tif")
                .arg(TileIdxX, 2, 10, QLatin1Char('0'))
                .arg(TileIdxY + 1, 2, 10, QLatin1Char('0'));
            srcinfo.topLeftPixel = m_domains.at(0).topLeftPixel;
            srcinfo.topLeftLine = 0;
            srcinfo.width = (x < nXSize - 1 ? (int) x : nXSize - 1)
                - srcinfo.topLeftPixel + 1;
            srcinfo.height = y - nYSize + 1;
            m_domains.append(srcinfo);
        }
        GDALDestroyDriverManager();
    }
    catch (QString &filename)
    {
        emit progressMsg(QString(tr("Error: missing file %1")).arg(filename));
        qCritical()<<"Error: missing file"<<filename;
        return false;
    }
    return true;
}

Trans2Cart::~Trans2Cart()
{
}
