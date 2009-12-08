////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL$
// Purpose: header file for AboutDialog class
////////////////////////////////////////////////////////////////////////

#ifndef ABOUTDIALOG_H
#define ABOUTDIALOG_H

#include "ui_about.h"

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

#endif // ABOUTDIALOG_H
