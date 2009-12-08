////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL$
// Purpose: 
////////////////////////////////////////////////////////////////////////

#ifndef OPTIONSDIALOG_H
#define OPTIONSDIALOG_H

#include <QDialog>
#include "ui_optionsdialog.h"

class OptionsDialog : public QDialog
{
	Q_OBJECT

public:
	OptionsDialog(QWidget *parent = 0, Qt::WFlags flags = 0);
	~OptionsDialog();

public:
	Ui::OptionsDialog ui;
};

#endif // OPTIONSDIALOG_H
