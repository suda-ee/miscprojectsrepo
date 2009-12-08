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
    QString iptfilename = qApp->applicationDirPath()
	.append("/../../../test/testData/njCleR30kmRast.tif");
    Trans2Cart trans;
    QFile fd("outdata.txt");
    fd.open(QIODevice::WriteOnly);
    fd.write(trans.trans2WGS84(iptfilename));
    fd.close();
}

QTEST_MAIN(test_Trans2Cart)
#include "test_Trans2Cart.moc"
