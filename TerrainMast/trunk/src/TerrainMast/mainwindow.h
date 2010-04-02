////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// Purpose: 
////////////////////////////////////////////////////////////////////////

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "ui_mainwindow.h"
#include <QCompleter>

class mainwindow : public QMainWindow
{
	Q_OBJECT

public:
	mainwindow(QWidget *parent = 0, Qt::WFlags flags = 0);

private slots:
	void aboutSoftware( void );
	void showOptionsDialog( void );
	void selectInputFile();
	void selectOutputFile();
	void transDecToDMS();
	void transDMSToDec(const QString & text);
	void showSrcFileMetaData();
	void startTransFile(bool checked = false);
        void startTransSRTM(bool checked = false);

private:
	Ui::MainWindow ui;
	QCompleter *completer;
};

#endif // MAINWINDOW_H
