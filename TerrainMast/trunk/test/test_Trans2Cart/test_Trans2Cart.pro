########################################################################
# Copyright 2009 Hertz Laboratory.
# Copyright 2009 Hollywell Corporation.
# $Id$
# $URL: F:\CAI\TerrainMast-hg/test/test_Trans2Cart/test_Trans2Cart.pro,v bfb6c31ac4dc 2009/12/10 20:06:44 > $
# Purpose: 
########################################################################

TEMPLATE = app
QT += testlib
TARGET = test_Trans2Cart
win32 {
    CONFIG += embed_manifest_exe console
}
#QT +=

SOURCES += test_Trans2Cart.cpp

CONFIG(debug, debug|release) {
    DESTDIR = ../../build/$${TARGET}/debug
    MOC_DIR = ../../build/$${TARGET}/debug
    OBJECTS_DIR = ../../build/$${TARGET}/debug
    RCC_DIR = ../../build/$${TARGET}/debug
    UI_DIR = ../../build/$${TARGET}/debug
} else {
    DESTDIR = ../../build/$${TARGET}/release
    MOC_DIR = ../../build/$${TARGET}/release
    OBJECTS_DIR = ../../build/$${TARGET}/release
    RCC_DIR = ../../build/$${TARGET}/release
    UI_DIR = ../../build/$${TARGET}/release
}

include(../../src/Trans2Cart/Trans2Cart.pri)
