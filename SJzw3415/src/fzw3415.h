/*
 * fzw3415.h - header file for ZW3415 meter (Full Function)
 *
 * Copyright (c) 2009 Wenfeng CAI
 */

#ifndef FZW3415_H
#define FZW3415_H

#include <QtCore/QObject>
#include <QtCore/QTimer>

#include "modbus.h"

#ifdef Q_WS_WIN

// define minimum Windows support for NT

#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0400
#endif

#ifndef WINVER
#define WINVER _WIN32_WINNT
#endif

//---------------------------------------------------------------------------
// high resolution timer object with inline functions
class THighResTimer
{
private:
    LARGE_INTEGER t0,t1,f;
public:
    THighResTimer(void)
    {
        QueryPerformanceFrequency(&f);
    }

    void start(void)   // reset timer
    {
        DWORD_PTR oldmask = ::SetThreadAffinityMask(::GetCurrentThread(), 0);
        QueryPerformanceCounter(&t0);
        ::SetThreadAffinityMask(::GetCurrentThread(), oldmask);
    }

    double restart(void)  // elapsed time in seconds
    {
        double dt;

        DWORD_PTR oldmask = ::SetThreadAffinityMask(::GetCurrentThread(), 0);
        QueryPerformanceCounter(&t1);
        ::SetThreadAffinityMask(::GetCurrentThread(), oldmask);
        dt=t1.QuadPart-t0.QuadPart;
        t0 = t1;
        return dt/f.QuadPart;
    }
};

#endif

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
    void filteredBundleDataReady(int num, float mTime, float *filteredData);

private:
    int slaveAddr;
#ifdef Q_WS_WIN
    UINT timerId;   
#endif
    modbus_param_t * m_mbParam;
    THighResTimer tTime;
    float mTime;
    float filteredData[6]; //last one for IEC6100-4-7 A1:2008 Page14 filter (power)
};
#endif // FZW3415_H
