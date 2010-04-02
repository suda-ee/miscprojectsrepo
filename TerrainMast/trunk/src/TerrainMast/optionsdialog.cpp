////////////////////////////////////////////////////////////////////////
// Copyright 2009 Hertz Laboratory.
// Copyright 2009 Hollywell Corporation.
// $Id$
// $URL: svn://land.rf/projects/TerrainMast/trunk/src/TerrainMast/optionsdialog.cpp $
// Purpose: 
////////////////////////////////////////////////////////////////////////

#include "optionsdialog.h"
#include <QStyleFactory>
#include <QSettings>
#include <QDir>
#include <QFileDialog>

OptionsDialog::OptionsDialog(QWidget *parent, Qt::WFlags flags) 
    : QDialog(parent, flags)
{
    ui.setupUi(this);
    setAttribute(Qt::WA_DeleteOnClose);
    ui.cmbStyle->addItems(QStyleFactory::keys());
    for (int i = 0; i < ui.cmbStyle->count(); i++)
    {
	QString styleName = ui.cmbStyle->itemText(i);
	QStyle *candidate = QStyleFactory::create(styleName);
	Q_ASSERT(candidate);
	if (candidate->metaObject()->className()
	    == QApplication::style()->metaObject()->className()) 
	{
	    ui.cmbStyle->setCurrentIndex(i);
	    break;
	}
	delete candidate;
    }
    connect(ui.cmbStyle, SIGNAL(currentIndexChanged(const QString &)), this, SLOT(changeStyle(const QString &)));
    //QStringList qmFileList(QDir(qApp->applicationDirPath() + "/locale").entryList(QStringList("TerrainMast*qm")));
    //for(int i = 0; i < qmFileList.count(); i++)
    //{
    //    qmFileList[i] = qmFileList[i].remove("TerrainMast_", Qt::CaseInsensitive);
    //    qmFileList[i] = qmFileList[i].remove(".qm", Qt::CaseInsensitive);
    //}
    // hide lang select now
    ui.lblLang->hide();
    ui.cmbLanguage->hide();

    QSettings settings;
    ui.lnSRTMDir->setText(settings.value("SRTM/dir").toString());

    connect(ui.btSRTMDir, SIGNAL(clicked()), this,
           SLOT(selectSRTMDir()));
    
}

OptionsDialog::~OptionsDialog()
{

}

void OptionsDialog::changeStyle(const QString & styleName)
{
    qApp->setStyle(styleName);
}

void OptionsDialog::accept()
{
    QSettings settings;
    settings.setValue("Appearance/style", ui.cmbStyle->currentText());
    settings.setValue("SRTM/dir", ui.lnSRTMDir->text());
    //QLocale::setDefault(QLocale::c());
    //QEvent ev(QEvent::LanguageChange);
    //qApp->sendEvent(qApp, &ev);
    QDialog::accept();
}

void OptionsDialog::selectSRTMDir()
{
    ui.lnSRTMDir->setText(QFileDialog::getExistingDirectory(this, QString(),
              ui.lnSRTMDir->text()));
}
