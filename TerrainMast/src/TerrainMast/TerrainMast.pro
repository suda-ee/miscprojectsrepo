########################################################################
# Copyright 2009 Hertz Laboratory.
# Copyright 2009 Hollywell Corporation.
# $Id$
# $URL$
# Purpose: 
########################################################################

TEMPLATE = app
TARGET = TerrainMast
VERSION = 0.1.0
win32 {
    CONFIG += embed_manifest_exe windows 
    #CONFIG += embed_manifest_exe console
}
#QT +=

SOURCES += main.cpp mainwindow.cpp optionsdialog.cpp

HEADERS += mainwindow.h aboutdialog.h optionsdialog.h

TRANSLATIONS = TerrainMast_zh_CN.ts

#INCLUDEPATH += 

FORMS += ui/mainwindow.ui ui/about.ui ui/optionsdialog.ui

RESOURCES += ../../resources/main.qrc
win32:RC_FILE = TerrainMast.rc
target.path = ../../dist
INSTALLS += target
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