////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL$
// Purpose: 
////////////////////////////////////////////////////////////////////////

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "ui_mainwindow.h"

class mainwindow : public QMainWindow
{
	Q_OBJECT

public:
	mainwindow(QWidget *parent = 0, Qt::WFlags flags = 0);
	~mainwindow();

private slots:
	void aboutSoftware( void );
	void showOptionsDialog( void );
	void changeStyle(const QString &stylename);

private:
	Ui::MainWindow ui;
};

#endif // MAINWINDOW_H
