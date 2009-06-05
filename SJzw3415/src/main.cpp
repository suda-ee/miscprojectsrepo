/*
 * main.cpp - main file for SJzw3415
 *
 * Copyright (c) 2009 Wenfeng CAI
 *
 */


#include <QtGui/QApplication>
#include "mainwindow.h"

MainWindow * globalMainWin = NULL;

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);

	QApplication::setOrganizationName( "SJ" );
	QApplication::setOrganizationDomain( "www.com" );
	QApplication::setApplicationName( "SJzw3415" );

	MainWindow w;
	w.show();

	globalMainWin = &w;

	return a.exec();
}
