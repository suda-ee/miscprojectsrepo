////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL$
// Purpose: Transform GDAL src image to Local Cartesian Coordinate
////////////////////////////////////////////////////////////////////////

#ifndef TRANS2CART_H
#define TRANS2CART_H

#include <QObject>
#include <QProcess>

class Trans2Cart : public QObject
{
    Q_OBJECT

public:
    Trans2Cart(QObject *parent = 0);
    ~Trans2Cart();

    void trans2WGS84(const QString &srcfilename, const QString &mdfilename);

};

#endif // TRANS2CART_H
