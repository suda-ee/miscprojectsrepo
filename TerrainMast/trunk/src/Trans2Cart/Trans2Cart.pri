########################################################################
# Copyright 2009 Hertz Laboratory.
# Copyright 2009 Hollywell Corporation.
# $Id$
# Purpose: 
########################################################################

include(../../3rdparty/gdal/gdal.pri)
include(../../3rdparty/3rdparty.pri)
include(../gdaltransform/gdaltransform.pri)

INCLUDEPATH += $$PWD

SOURCES += $$PWD/Trans2Cart.cpp

HEADERS += $$PWD/Trans2Cart.h
