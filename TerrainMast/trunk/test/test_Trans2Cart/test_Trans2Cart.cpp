////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL: F:\CAI\TerrainMast-hg/test/test_Trans2Cart/test_Trans2Cart.cpp,v bfb6c31ac4dc 2009/12/10 20:06:44 > $
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include <QtTest/QtTest>
#include "Trans2Cart.h"

class test_Trans2Cart: public QObject
{
    Q_OBJECT
private slots:
    void test_transDEM2Cartesian();
};

void test_Trans2Cart::test_transDEM2Cartesian()
{
    qDebug() << QTime::currentTime();
    QString iptfilename = qApp->applicationDirPath()
	.append("/../../../test/testData/njCleR30kmRast.img");
    Trans2Cart trans;
    trans.initSingleFileTrans(iptfilename, 118.6722527778,
	31.8652750001, 200, 200, true);
    trans.transDEM2Terrain("rr.trn", 118.6722527778, 31.8652750001, 0.);
    qDebug() << QTime::currentTime();
}

QTEST_MAIN(test_Trans2Cart)
#include "test_Trans2Cart.moc"
