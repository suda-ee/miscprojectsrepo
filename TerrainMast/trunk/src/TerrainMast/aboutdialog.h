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
		QDialog( _parent,  Qt::WindowTitleHint | Qt::WindowSystemMenuHint )
	{
		setupUi( this );
		aboutTextLabel->setText(
			aboutTextLabel->text().arg( QString(PRODUCT_VERSION_STR)
			    .remove(QRegExp(",\\d+$")).replace(QRegExp(","), ".") ));
	}
} ;

#endif // ABOUTDIALOG_H
