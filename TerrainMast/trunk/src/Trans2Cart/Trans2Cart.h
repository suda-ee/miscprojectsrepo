////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// Purpose: Transform GDAL src image to Local Cartesian Coordinate
////////////////////////////////////////////////////////////////////////

#ifndef TRANS2CART_H
#define TRANS2CART_H

#include <QTextStream>

class Trans2Cart : public QObject
{
    Q_OBJECT

public:
    Trans2Cart(QObject *parent = 0);
    ~Trans2Cart();
    void initSingleFileTrans(const QString &srcfilename, double cutCenterLong,
	double cutCenterLat, double cutWidth, double cutHeight, bool cutFlag);
    bool initSRTMTrans(const QString &srcDirName, double cutCenterLong,
            double cutCenterLat, double cutWidth, double cutHeight);
    void transDEM2Terrain(const QString &destFilename, double OriLong,
       	double OriLat, double OriZ);
    double getDimensionInMeters(const QString &srcfilename, const QString &flagLongLat);

signals:
    void progressNum(int progress);
    void progressMsg(const QString & message);


private:
    void trans2WGS84(const QString &srcfilename, int topLeftPixel, int topLeftLine, int width, int height);
    void transSingleDomain2Cartesian(const QString &srcfilename, QTextStream &out,
	int topLeftPixel, int topLeftLine, int width, int height);
    int getResSize(const QString &srcfilename, double &resX, double &resY);
    
    typedef struct SrcInfo {
	QString filename;
	int topLeftPixel;
	int topLeftLine;
	int width;
	int height;
    } tSrcInfo;				/* ----------  end of struct SrcInfo  ---------- */

    int nCountValidPoint;
    double *dfX;
    double *dfY;
    double *dfZ;
    double m_OriLat, m_OriLong, m_OriZ;
    QList<tSrcInfo> m_domains;
};

#endif // TRANS2CART_H
