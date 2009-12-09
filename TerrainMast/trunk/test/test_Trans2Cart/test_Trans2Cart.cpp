////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL$
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include <QtTest/QtTest>
#include "Trans2Cart.h"

class test_Trans2Cart: public QObject
{
    Q_OBJECT
private slots:
    void test_trans2WGS84();
};

void test_Trans2Cart::test_trans2WGS84()
{
    qDebug() << QTime::currentTime();
    QString iptfilename = qApp->applicationDirPath()
	.append("/../../../test/testData/nj30kmWGS84.tif");
    Trans2Cart trans;
    trans.trans2WGS84(iptfilename, "outdata.txt");
    qDebug() << QTime::currentTime();
}

QTEST_MAIN(test_Trans2Cart)
#include "test_Trans2Cart.moc"
