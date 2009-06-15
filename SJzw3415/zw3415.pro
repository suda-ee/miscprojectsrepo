TARGET = SJzw3415
TEMPLATE = app
VERSION = 0.1.0
CONFIG += windows
CONFIG += debug_and_release

# CONFIG += embed_manifest_exe
SOURCES += src/main.cpp \
    src/mainwindow.cpp \
    src/fzw3415.cpp \
    src/resulttablemodel.cpp \
    3rdparty/qextserialport/qextserialport.cpp \
    3rdparty/qextserialport/qextserialenumerator.cpp \
    3rdparty/qextserialport/qextserialbase.cpp \
    3rdparty/libmodbus/modbus.c
HEADERS += src/mainwindow.h \
    src/fzw3415.h \
    src/resulttablemodel.h \
    3rdparty/qextserialport/qextserialport.h \
    3rdparty/qextserialport/qextserialenumerator.h \
    3rdparty/qextserialport/qextserialbase.h \
    3rdparty/libmodbus/modbus.h

INCLUDEPATH += 3rdparty/libmodbus 3rdparty/qextserialport

unix:HEADERS += 3rdparty/qextserialport/posix_qextserialport.h
unix:SOURCES += 3rdparty/qextserialport/posix_qextserialport.cpp
unix:DEFINES += _TTY_POSIX_
win32:HEADERS += 3rdparty/qextserialport/win_qextserialport.h
win32:SOURCES += 3rdparty/qextserialport/win_qextserialport.cpp
win32:DEFINES += _TTY_WIN_
win32:LIBS += -lsetupapi -lwinmm

FORMS += forms/mainwindow.ui \
    forms/about.ui

RESOURCES += data/SJzw3415.qrc
win32:RC_FILE = SJzw3415.rc
