/*
 * mainwindow.cpp - implementation of MainWindow class
 *
 */

#include <QtCore/QSettings>
#include <QtCore/QDebug>
#include <QtCore/QTimer>
#include <QtGui/QMessageBox>
#include <QtGui/QScrollBar>
#include <QFileDialog>

#include "mainwindow.h"


extern MainWindow * globalMainWin;
static inline QString embracedString( const QString & s );


MainWindow::MainWindow( QWidget * parent ) :
	QMainWindow( parent )
{
    setupUi(this);
    resultData = new resulttablemodel(this);

    QSettings settings;

    int portIndex = 0;
    int i = 0;
    ports = QextSerialEnumerator::getPorts();
    if( !ports.isEmpty() )
    {
	foreach( QextPortInfo port, ports)
	{
            serialPort->addItem( port.friendName );
            if( port.friendName == settings.value( "serialinterface" ) )
            {
                    portIndex = i;
            }
            ++i;
	}
	serialPort->setCurrentIndex( portIndex );
#ifdef Q_OS_WIN32
        QString portName = embracedString( ports[portIndex].friendName ) +
									":";
#else
        QString portName = ports[portIndex].physName;
#endif

        m_zw3415Meter = new FZW3415(this, slaveID->value(), portName.toAscii(), 
                baud->currentText().toInt());

	connect( slaveID, SIGNAL( valueChanged( int ) ),
			m_zw3415Meter, SLOT( setSlaveAddr(int) ) );
	connect( serialPort, SIGNAL(  currentIndexChanged ( int ) ),
			this, SLOT( changePortInfo() ) );
	connect( baud, SIGNAL(  currentIndexChanged ( int ) ),
			this, SLOT( changePortInfo() ) );
        connect(m_zw3415Meter, SIGNAL( filteredBundleDataReady(int, QTime&, float*) ),
                resultData, SLOT( appendData(int, QTime &, float*) ));
        connect(resultData, SIGNAL(rowsInserted(QModelIndex, int, int)),
                resultTable, SLOT(scrollToBottom()));
    }

    m_statusInd = new QWidget;
    m_statusInd->setFixedSize( 16, 16 );
    m_statusText = new QLabel;
    Ui_MainWindowClass::statusBar->addWidget( m_statusInd );
    Ui_MainWindowClass::statusBar->addWidget( m_statusText, 10 );
    resetStatus();

    resultTable->setModel(resultData);
}

void MainWindow::changePortInfo()
{
    const int iface = serialPort->currentIndex();

    if( !ports.isEmpty() )
    {
        QSettings settings;
        settings.setValue( "serialinterface", ports[iface].friendName );
#ifdef Q_OS_WIN32
        QString port = embracedString( ports[iface].friendName ) +
									":";
#else
        QString port = ports[iface].physName;
#endif
        m_zw3415Meter->setSerialPort(port.toAscii(), baud->currentText().toInt());
    }
}

void MainWindow::ctrlMeterTimer(bool checked)
{
    if (checked)
    {
        btFTest->setText(trUtf8("停止滤波测量"));
        m_zw3415Meter->startRead_Filter();
    }
    else
    {
        btFTest->setText(trUtf8("开始滤波测量"));
        m_zw3415Meter->stopRead_Filter();
    }
}

void MainWindow::clearTable()
{
    resultData->removeRows(0, resultData->rowCount());
}

void MainWindow::exportToFile()
{
    int i;
    QString filename = QFileDialog::getSaveFileName(this,
            trUtf8("选择保存文件"), QString(), trUtf8("文件 (*.csv)"));
    QFile file(filename);
    file.open(QIODevice::WriteOnly);
    QTextStream out(&file);
    QList<int> tTime = resultData->getAllTime();
    QList<float> *data = resultData->getAllData();
    out<<trUtf8("时间 (ms)")<<", "<<trUtf8("电压 (V)")<<", "
            <<trUtf8("电流 (A)")<<", "<<trUtf8("平均功率 (W)")<<", "
            <<trUtf8("功率因数")<<", "<<trUtf8("频率 (Hz)")<<", "
            <<trUtf8("指定功率 (W)")<<"\r\n";
    for (i = 0; i < data[0].size(); i++)
    {
        out<<tTime.at(i)<<", "<<data[0].at(i)<<", "<<data[1].at(i)<<", "
                <<data[2].at(i)<<", " <<data[3].at(i)<<", "<<data[4].at(i)
                <<", "<<data[5].at(i)<<"\r\n";
    }
    file.close();
}

MainWindow::~MainWindow()
{
}

static inline QString embracedString( const QString & s )
{
	return s.section( '(', 1 ).section( ')', 0, 0 );
}

void MainWindow::resetStatus( void )
{
	m_statusText->setText( tr( "Ready" ) );
	m_statusInd->setStyleSheet( "background: #aaa;" );
}

void MainWindow::aboutSoftware( void )
{
	AboutDialog( this ).exec();
}
