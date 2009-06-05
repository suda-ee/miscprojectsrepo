/*
 * fzw3415.h - header file for ZW3415 meter (Full Function)
 *
 * Copyright (c) 2009 Wenfeng CAI
 */

#ifndef FZW3415_H
#define FZW3415_H

#include <QtCore/QObject>
#include <QtCore/QTimer>
#include <QtCore/QTime>

#include "modbus.h"

class FZW3415 : public QObject
{
    Q_OBJECT
public:
    FZW3415(QObject * parent, int slave, QString port, int baudRate = 19200);
    ~FZW3415();
    int setSerialPort(QString port, int baudRate = 19200);
    int getBundleVals(float vals[]);

private:
    int readBundleVals();
    void filter();

public slots:
    void startRead_Filter();
    void stopRead_Filter();
    void timerOut();
    void setSlaveAddr(int slave);

signals:
    void bundleDataReady(int num, float *filteredData);
    void filteredBundleDataReady(int num, QTime &tTime, float *filteredData);

private:
    int slaveAddr;
    QTimer *timer;   
    modbus_param_t * m_mbParam;
    QTime tTime;
    float filteredData[6]; //last one for IEC6100-4-7 A1:2008 Page14 filter (power)
};

#endif // FZW3415_H
