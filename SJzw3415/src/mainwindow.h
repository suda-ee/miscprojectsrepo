/*
 * mainwindow.h - header file for MainWindow class
 *
 * Copyright (c) 2009 Wenfeng CAI
 */

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtGui/QMainWindow>

#include "fzw3415.h"
#include "ui_about.h"
#include "ui_mainwindow.h"
#include "qextserialenumerator.h"
#include "resulttablemodel.h"

class QLabel;



class AboutDialog : public QDialog, public Ui::AboutDialog
{
public:
	AboutDialog( QWidget * _parent ) :
		QDialog( _parent )
	{
		setupUi( this );
		aboutTextLabel->setText(
			aboutTextLabel->text().arg( "0.1.0" ) );
	}
} ;


class MainWindow : public QMainWindow, public Ui::MainWindowClass
{
	Q_OBJECT
public:
	MainWindow( QWidget * parent = 0 );
	~MainWindow();

private slots:
	void changePortInfo();
	void resetStatus( void );
	void aboutSoftware( void );
        void ctrlMeterTimer(bool checked);
        void clearTable();
        void exportToFile();


private:
	FZW3415 * m_zw3415Meter;
	QWidget * m_statusInd;
	QLabel * m_statusText;
	QList<QextPortInfo> ports;
        resulttablemodel * resultData;

};

#endif // MAINWINDOW_H
