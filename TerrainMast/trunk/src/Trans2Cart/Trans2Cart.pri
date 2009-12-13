########################################################################
# Copyright 2009 Hertz Laboratory.
# Copyright 2009 Hollywell Corporation.
# $Id$
# $URL: svn://land.rf/projects/TerrainMast/trunk/src/Trans2Cart/Trans2Cart.pri $
# Purpose: 
########################################################################

include(../../3rdparty/gdal/gdal.pri)
include(../gdaltransform/gdaltransform.pri)

INCLUDEPATH += $$PWD

SOURCES += $$PWD/Trans2Cart.cpp

HEADERS += $$PWD/Trans2Cart.h
