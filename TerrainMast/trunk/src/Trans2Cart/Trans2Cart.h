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

class Trans2Cart : public QObject
{
	Q_OBJECT

public:
	Trans2Cart(QObject *parent = 0);
	~Trans2Cart();

public slots:
	QByteArray trans2WGS84(const QString &filename);

};

#endif // TRANS2CART_H
