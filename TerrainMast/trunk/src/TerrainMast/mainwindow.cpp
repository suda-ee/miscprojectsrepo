////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include "mainwindow.h"
#include "aboutdialog.h"
#include "optionsdialog.h"
#include <QDirModel>
#include <QFileDialog>
#include <QProcess>
#include "cpl_conv.h"
#include "Trans2Cart.h"
#include <QDebug>

mainwindow::mainwindow(QWidget *parent, Qt::WFlags flags)
	: QMainWindow(parent, flags)
{
	ui.setupUi(this);
	completer = new QCompleter(this);
	completer->setCompletionMode(QCompleter::PopupCompletion);
	QDirModel *dirModel = new QDirModel(completer);
        completer->setModel(dirModel);
	ui.lnInputFile->setCompleter(completer);
	ui.lnOutputFile->setCompleter(completer);
	ui.lnOutputFile2->setCompleter(completer);

        connect(ui.action_About, SIGNAL(triggered()), this,
	       SLOT(aboutSoftware()));
        connect(ui.action_Options, SIGNAL(triggered()), this,
	       SLOT(showOptionsDialog()));

        connect(ui.btSelectInputFile, SIGNAL(clicked()), this,
	       SLOT(selectInputFile()));
        connect(ui.btSelectOutputFile, SIGNAL(clicked()), this,
	       SLOT(selectOutputFile()));
        connect(ui.btSelectOutputFile2, SIGNAL(clicked()), this,
	       SLOT(selectOutputFile()));

        connect(ui.dspnLongOri, SIGNAL(editingFinished()), this,
	       SLOT(transDecToDMS()));
        connect(ui.dspnLongOri2, SIGNAL(editingFinished()), this,
	       SLOT(transDecToDMS()));
        connect(ui.dspnLatOri, SIGNAL(editingFinished()), this,
	       SLOT(transDecToDMS()));
        connect(ui.dspnLatOri2, SIGNAL(editingFinished()), this,
	       SLOT(transDecToDMS()));
        connect(ui.lnLongOri, SIGNAL(textEdited(const QString &)), this,
	       SLOT(transDMSToDec(const QString &)));
        connect(ui.lnLongOri2, SIGNAL(textEdited(const QString &)), this,
	       SLOT(transDMSToDec(const QString &)));
        connect(ui.lnLatOri, SIGNAL(textEdited(const QString &)), this,
	       SLOT(transDMSToDec(const QString &)));
        connect(ui.lnLatOri2, SIGNAL(textEdited(const QString &)), this,
	       SLOT(transDMSToDec(const QString &)));

        connect(ui.lnInputFile, SIGNAL(editingFinished()), this,
	       SLOT(showSrcFileMetaData()));

        connect(ui.btStartTransFile, SIGNAL(clicked(bool)), this,
	       SLOT(startTransFile(bool)));
}

void mainwindow::showOptionsDialog( void )
{
    OptionsDialog *optionsdialog;
    optionsdialog = new OptionsDialog(this);
    optionsdialog->exec();
}

void mainwindow::aboutSoftware( void )
{
	AboutDialog( this ).exec();
}

void mainwindow::selectInputFile()
{
    ui.lnInputFile->setText(QFileDialog::getOpenFileName(this));
    showSrcFileMetaData();
}

void mainwindow::selectOutputFile()
{
    if (sender() == ui.btSelectOutputFile2)
    {
	ui.lnOutputFile2->setText(QFileDialog::getSaveFileName(this, QString(),
		    QString(), tr("EMCube Terrain File (*.trn)")));
    }
    else
    {
	ui.lnOutputFile->setText(QFileDialog::getSaveFileName(this, QString(),
		    QString(), tr("EMCube Terrain File (*.trn)")));
    }
}

void mainwindow::transDecToDMS()
{
    if (sender() == ui.dspnLongOri)
    {
	ui.lnLongOri->setText(CPLDecToDMS(ui.dspnLongOri->value(), "Long", 3));
    }
    else if (sender() == ui.dspnLongOri2)
    {
	ui.lnLongOri2->setText(CPLDecToDMS(ui.dspnLongOri2->value(), "Long", 3));
    }
    else if (sender() == ui.dspnLatOri)
    {
	ui.lnLatOri->setText(CPLDecToDMS(ui.dspnLatOri->value(), "Lat", 3));
    }
    else if (sender() == ui.dspnLatOri2)
    {
	ui.lnLatOri2->setText(CPLDecToDMS(ui.dspnLatOri2->value(), "Lat", 3));
    }
}

void mainwindow::transDMSToDec(const QString & text)
{
    QString intext = text;
    intext = intext.remove(" ");
    if (sender() == ui.lnLongOri)
    {
	ui.dspnLongOri->setValue(CPLDMSToDec(intext.toAscii().data()));
    }
    else if (sender() == ui.lnLongOri2)
    {
	ui.dspnLongOri2->setValue(CPLDMSToDec(intext.toAscii().data()));
    }
    else if (sender() == ui.lnLatOri)
    {
	ui.dspnLatOri->setValue(CPLDMSToDec(intext.toAscii().data()));
    }
    else if (sender() == ui.lnLatOri2)
    {
	ui.dspnLatOri2->setValue(CPLDMSToDec(intext.toAscii().data()));
    }
}

void mainwindow::showSrcFileMetaData()
{
    QProcess process;
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    if (env.value("GDAL_DATA").isEmpty())
	env.insert("GDAL_DATA", qApp->applicationDirPath() + "/gdal-data"); // Add an environment variable
    env.insert("PATH", env.value("PATH") + ";" + qApp->applicationDirPath());
    env.insert("PATH", env.value("PATH") + ";" + qApp->applicationDirPath() + "/bin");
    process.setProcessEnvironment(env);
    QStringList arguments;
    arguments << ui.lnInputFile->text();
    process.start(qApp->applicationDirPath() + "/bin/gdalinfo", arguments);
    process.waitForFinished();
    ui.ptxtSrcMeta->setPlainText(process.readAllStandardOutput());
}

void mainwindow::startTransFile(bool checked)
{
    ui.btStartTransFile->setEnabled(false);
    Trans2Cart *transobj = new Trans2Cart(this);

    connect(transobj, SIGNAL(progressMsg(const QString &)), ui.lbMsgProgress,
	   SLOT(setText(const QString &)));
    connect(transobj, SIGNAL(progressNum(int)), ui.transFileProgressBar,
	   SLOT(setValue(int)));

    transobj->transDEM2Cartesian(ui.lnInputFile->text(), ui.lnOutputFile->text(),
	ui.dspnLongOri->value(), ui.dspnLatOri->value(), ui.spnVerticalShift->value());

    ui.btStartTransFile->setEnabled(true);
    delete transobj;
}
