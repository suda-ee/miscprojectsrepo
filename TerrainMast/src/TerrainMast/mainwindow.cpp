////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL$
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include "mainwindow.h"
#include "aboutdialog.h"
#include "optionsdialog.h"

mainwindow::mainwindow(QWidget *parent, Qt::WFlags flags)
	: QMainWindow(parent, flags)
{
	ui.setupUi(this);

        connect(ui.action_About, SIGNAL(triggered()), this,
	       SLOT(aboutSoftware()));
        connect(ui.action_Options, SIGNAL(triggered()), this,
	       SLOT(showOptionsDialog()));
}

void mainwindow::showOptionsDialog( void )
{
    OptionsDialog *optionsdialog;
    optionsdialog = new OptionsDialog(this);
    connect(optionsdialog->ui.cmbStyle, SIGNAL(activated(const QString&)),
	   this, SLOT(changeStyle(const QString &)));
    optionsdialog->exec();
}

void mainwindow::changeStyle(const QString &stylename)
{
     QApplication::setStyle(stylename);
}

void mainwindow::aboutSoftware( void )
{
	AboutDialog( this ).exec();
}

mainwindow::~mainwindow()
{

}
