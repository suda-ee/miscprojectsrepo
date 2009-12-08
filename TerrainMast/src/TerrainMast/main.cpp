////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL$
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include "mainwindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);
	mainwindow w;
	w.show();
	return a.exec();
}
