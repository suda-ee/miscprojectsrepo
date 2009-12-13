////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL: svn://land.rf/projects/TerrainMast/trunk/src/TerrainMast/main.cpp $
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include "mainwindow.h"
#include <QApplication>
#include <QSettings>
#include <QTranslator>

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);
	a.setApplicationName("TerrainMast");
	a.setApplicationVersion(PRODUCT_VERSION_STR);
	a.setOrganizationName("Hollywell");
	a.setOrganizationDomain("holly-well.com");
	QSettings settings;
	//QTranslator qtTranslator;
	//qtTranslator.load("qt_" + settings.value("Appearance/lang").toString(),
        //     qApp->applicationDirPath() + "/locale");
	//a.installTranslator(&qtTranslator);

	//QTranslator myappTranslator;
	//myappTranslator.load("TerrainMast_" + settings.value("Appearance/lang").toString(),
	//	qApp->applicationDirPath() + "/locale");
	//a.installTranslator(&myappTranslator);
	a.setStyle(settings.value("Appearance/style").toString());
	mainwindow w;
	w.show();
	return a.exec();
}
