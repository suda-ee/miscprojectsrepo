/*
 * fzw3415.cpp - implementation of ZW3415 class
 *
 */

#include <QtCore/QDebug>
#include <QtCore/QtEndian>
#include "fzw3415.h"

FZW3415 * gzw3415;

#ifdef Q_WS_WIN
void CALLBACK TimerOut(UINT wTimerID, UINT msg, 
    DWORD dwUser, DWORD dw1, DWORD dw2);
#endif

FZW3415::FZW3415(QObject * parent, int slave, QString port, int baudRate) :
    QObject(parent),
    m_mbParam(NULL)
{
    filteredData[5] = 0.;
    slaveAddr = slave;
    setSerialPort(port, baudRate);
}

FZW3415::~FZW3415()
{
#ifdef Q_WS_WIN
    timeKillEvent(timerId);
#endif
}

int FZW3415::setSerialPort(QString port, int baudRate)
{
    if( m_mbParam )
    {
        modbus_close( m_mbParam );
        delete m_mbParam;
    }

    m_mbParam = new modbus_param_t;
    modbus_init_rtu( m_mbParam, port.toAscii().constData(),
                    baudRate, "none", 8, 1);

    return modbus_connect( m_mbParam );
}

void FZW3415::setSlaveAddr(int slave)
{
    slaveAddr = slave;
}

int FZW3415::readBundleVals()
{
    const int addr = 0x1000;
    int num = 10;
    quint32 dest32[5];
    uint16_t * dest16 = (uint16_t *) dest32;

    int ret = -1;
    int i;
    ret = read_holding_registers( m_mbParam, slaveAddr, addr,
                                            num, dest16 );
    mTime = mTime + tTime.restart() * 1000;
    if( m_mbParam == NULL )
    {
        return ret;
    }
    if( ret == num  )
    {
        for (i = 0; i < 10; i++)
        {
            dest16[i] = qFromBigEndian<uint16_t>(dest16[i]);
        }
        for (i = 0; i < 5; i++)
        {
            dest32[i] = qFromBigEndian<quint32>(dest32[i]);
        }
        qMemCopy(filteredData, dest32, 20);
        emit bundleDataReady(5, filteredData);
        return 0;
    }
    else
    {
        return ret;
    }
}

void FZW3415::startRead_Filter()
{
    DWORD_PTR dwUser;
    filteredData[5] = 0.;
#ifdef Q_WS_WIN
    timerId = timeSetEvent(200, 0, TimerOut, dwUser, TIME_PERIODIC);
    tTime.start();
#endif
    mTime = 0;
}

void FZW3415::stopRead_Filter()
{
#ifdef Q_WS_WIN
    timeKillEvent(timerId);
#endif
}

int FZW3415::getBundleVals(float vals[])
{
    readBundleVals();
    qMemCopy(vals, filteredData, 5 * sizeof(float));
    return 5;
}

//for IEC6100-4-7 A1:2008 Page14 filter (power)
void FZW3415::filter()
{
    float alpha = 8.012;
    float beta = 7.012;
    filteredData[5] = (filteredData[2] + beta * filteredData[5]) / alpha;
}

void FZW3415::timerOut()
{
    readBundleVals();
    filter();
    emit filteredBundleDataReady(6, mTime, filteredData);
}

#ifdef Q_WS_WIN
void CALLBACK TimerOut(UINT wTimerID, UINT msg, 
    DWORD dwUser, DWORD dw1, DWORD dw2) 
{ 
    gzw3415->timerOut();
}
#endif

extern "C" {
void busMonitorAddItem( uint8_t isRequest, uint8_t slave, uint8_t func, uint16_t addr, uint16_t nb, uint16_t crc )
{
}

void busMonitorRawData( uint8_t * data, uint8_t dataLen )
{
}

}
