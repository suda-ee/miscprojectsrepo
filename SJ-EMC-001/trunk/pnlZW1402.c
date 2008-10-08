#include <ansi_c.h>
#include <stdlib.h>
#include <windows.h>
#include <formatio.h>
#include <rs232.h>
#include <cvirte.h>     
#include <userint.h>
#include <utility.h>
#include "pnlZW1402.h"
#include "utilfunc.h"

static int pnlZw1402;
int portNumber, relQ = 1;
float backvalue;
unsigned char sendbuffer[512];
unsigned char buffer[512];
LPVOID lpParameter;

DWORD WINAPI ShutLED(LPVOID lpParameter)
{
    Delay(.3);
    SetCtrlVal(pnlZw1402, PNLZW1402_LED, 0);
    return 0;
}

int main (int argc, char *argv[])
{
    if (InitCVIRTE (0, argv, 0) == 0)
        return -1;  /* out of memory */
    if ((pnlZw1402 = LoadPanel (0, "pnlZW1402.uir", PNLZW1402)) < 0)
        return -1;
    DisplayPanel (pnlZw1402);
    RunUserInterface ();
    DiscardPanel (pnlZw1402);
    return 0;
}

int CVICALLBACK QuitCallback (int panel, int control, int event,
        void *callbackData, int eventData1, int eventData2)
{
    switch (event)
    {
        case EVENT_COMMIT:
            GetCtrlVal (panel, PNLZW1402_COMSEL, &portNumber);
            CloseCom (portNumber);
            QuitUserInterface (0);
            break;
    }
    return 0;
}

int CVICALLBACK OnLoopSel (int panel, int control, int event,
        void *callbackData, int eventData1, int eventData2)
{
    int value=0;
    switch (event)
    {
        case EVENT_VAL_CHANGED:
            GetCtrlVal (panel, control, &value);
            SetCtrlAttribute (panel, PNLZW1402_LOOPTIME, ATTR_VISIBLE, value);
            if (value == 0)
                SetCtrlAttribute (panel, PNLZW1402_LPTIMER, ATTR_ENABLED,
                        value);
            break;
    }
    return 0;
}

int CVICALLBACK OnRelCurSel (int panel, int control, int event,
        void *callbackData, int eventData1, int eventData2)
{
    int value;
    float currentval;
    switch (event)
    {
        case EVENT_VAL_CHANGED:
            GetCtrlVal (panel, control, &value);
            GetCtrlVal (panel, PNLZW1402_CURRENTNUM, &currentval);
            GetCtrlVal (panel, PNLZW1402_BGRDCUR, &backvalue);
            if (value == 0)
            {
                SetCtrlVal (panel, PNLZW1402_LEDZONG, 1);
                SetCtrlVal (panel, PNLZW1402_LEDJING, 0);
                SetCtrlAttribute (panel, PNLZW1402_CURRENTNUM,
                        ATTR_LABEL_TEXT, "总电流(A)");
                SetCtrlVal (panel, PNLZW1402_CURRENTNUM, currentval + backvalue);
            }
            else
            {
                SetCtrlVal (panel, PNLZW1402_LEDZONG, 0);
                SetCtrlVal (panel, PNLZW1402_LEDJING, 1);
                SetCtrlAttribute (panel, PNLZW1402_CURRENTNUM,
                        ATTR_LABEL_TEXT, "净电流(A)");
                SetCtrlVal (panel, PNLZW1402_CURRENTNUM, currentval - backvalue);
            }
            relQ = value;
            break;
    }
    return 0;
}

int CVICALLBACK OnPnl1402 (int panel, int event, void *callbackData,
        int eventData1, int eventData2)
{
    switch (event)
    {
        case EVENT_GOT_FOCUS:

            break;
        case EVENT_LOST_FOCUS:

            break;
        case EVENT_CLOSE:
            GetCtrlVal (panel, PNLZW1402_COMSEL, &portNumber);
            CloseCom (portNumber);
            QuitUserInterface (0);
            break;
    }
    return 0;
}

int CVICALLBACK OnTest (int panel, int control, int event,
        void *callbackData, int eventData1, int eventData2)
{
    long baudRate;
    int loopit;
    unsigned int instadd;
    unsigned short crccheck;
    switch (event)
    {
        case EVENT_COMMIT:
            SetCtrlAttribute (panel, control, ATTR_DIMMED, 1);
            GetCtrlVal (panel, PNLZW1402_COMSEL, &portNumber);
            GetCtrlVal (panel, PNLZW1402_BAUDRATESEL, &baudRate);
            OpenComConfig (portNumber, NULL, baudRate, 0, 8, 1, 0, 0);
            GetCtrlVal (panel, PNLZW1402_BGRDCUR, &backvalue);
            GetCtrlVal (panel, PNLZW1402_RELCURSWTCH, &relQ);
            /*Prepare send data*/
            GetCtrlVal (panel, PNLZW1402_IADDR, &instadd);
            sendbuffer[0] = (char) instadd;
            sendbuffer[1] = 0x03;
            sendbuffer[2] = 0x10; sendbuffer[3] = 0x02;
            sendbuffer[4] = 0x00; sendbuffer[5] = 0x02;
            crccheck = CrcCal(sendbuffer, 6);
            sda = crccheck; StoB();
            sendbuffer[6] = ucb[0]; sendbuffer[7] = ucb[1];

            GetCtrlVal (panel, PNLZW1402_LOOPMEASURE, &loopit);
            SetCtrlAttribute (panel, PNLZW1402_LPTIMER, ATTR_ENABLED, loopit);
            if (loopit == 0)
            {
                ComWrt (portNumber, sendbuffer, 8);
                if (ComRd (portNumber, buffer, 9) <= 0)
                {
                    SetCtrlVal(panel, PNLZW1402_TXTMSG, "通讯超时，请正确设置仪表参数！");
                }
                else
                {
                    crccheck = CrcCal(buffer, 7);
                    ucb[0] = buffer[7]; ucb[1] = buffer[8];
                    BtoS();
                    if (sda = crccheck)
                    {
                        uca[0] = buffer[3];
                        uca[1] = buffer[4];
                        uca[2] = buffer[5];
                        uca[3] = buffer[6];
                        BtoFr();
                        SetCtrlVal(panel, PNLZW1402_LED, 1);
                        CreateThread(NULL, 0, ShutLED, lpParameter, 0, NULL);
                        SetCtrlVal(panel, PNLZW1402_CURRENTNUM,
                                real - relQ * backvalue);
                        SetCtrlVal(panel, PNLZW1402_TXTMSG, "成功！");
                    }
                    else
                    {
                        SetCtrlVal(panel, PNLZW1402_TXTMSG, "CRC校验错误！");
                    }
                }
            }
            SetCtrlAttribute (panel, control, ATTR_DIMMED, 0);
            break;
    }
    return 0;
}

int CVICALLBACK OnLpTime (int panel, int control, int event,
        void *callbackData, int eventData1, int eventData2)
{
    unsigned short crccheck;
    int numberOfRows, year, month, day;
    Point cellp;
    char date[11];
    switch (event)
    {
        case EVENT_TIMER_TICK:
            ComWrt (portNumber, sendbuffer, 8);
            if (ComRd (portNumber, buffer, 9) <= 0)
            {
                SetCtrlVal(panel, PNLZW1402_TXTMSG, "通讯超时，请正确设置仪表参数！");
            }
            else
            {
                crccheck = CrcCal(buffer, 7);
                ucb[0] = buffer[7]; ucb[1] = buffer[8];
                BtoS();
                if (sda = crccheck)
                {
                    uca[0] = buffer[3];
                    uca[1] = buffer[4];
                    uca[2] = buffer[5];
                    uca[3] = buffer[6];
                    BtoFr();
                    SetCtrlVal(panel, PNLZW1402_LED, 1);
                    CreateThread(NULL, 0, ShutLED, lpParameter, 0, NULL);
                    SetCtrlVal(panel, PNLZW1402_CURRENTNUM,
                            real - relQ * backvalue);

                    GetSystemDate (&month, &day, &year);
                    GetNumTableRows (panel, PNLZW1402_TBLRCRD, &numberOfRows);
                    InsertTableRows (panel, PNLZW1402_TBLRCRD, numberOfRows + 1,
                            1, VAL_USE_MASTER_CELL_TYPE);
                    cellp.x = 1; cellp.y = numberOfRows + 1;
                    Fmt(date, "%i[w4]-%i[w2p0]-%i[w2p0]", year, month, day);
                    SetTableCellVal (panel, PNLZW1402_TBLRCRD, cellp,
                            date);
                    cellp.x++;
                    SetTableCellVal (panel, PNLZW1402_TBLRCRD, cellp,
                            TimeStr ());
                    cellp.x++;
                    SetTableCellVal (panel, PNLZW1402_TBLRCRD, cellp,
                            real - backvalue);
                    cellp.x++;
                    SetTableCellVal (panel, PNLZW1402_TBLRCRD, cellp,
                            real);
                }
                else
                {
                    SetCtrlVal(panel, PNLZW1402_TXTMSG, "CRC校验错误！");
                }
            }
            break;
    }
    return 0;
}

int CVICALLBACK OnGetBgr (int panel, int control, int event,
        void *callbackData, int eventData1, int eventData2)
{
    long baudRate;
    unsigned int instadd;
    unsigned short crccheck;
    switch (event)
    {
        case EVENT_COMMIT:
            SetCtrlAttribute (panel, control, ATTR_DIMMED, 1);
            GetCtrlVal (panel, PNLZW1402_COMSEL, &portNumber);
            GetCtrlVal (panel, PNLZW1402_BAUDRATESEL, &baudRate);
            OpenComConfig (portNumber, NULL, baudRate, 0, 8, 1, 0, 0);
            /*Prepare send data*/
            GetCtrlVal (panel, PNLZW1402_IADDR, &instadd);
            sendbuffer[0] = (char) instadd;
            sendbuffer[1] = 0x03;
            sendbuffer[2] = 0x10; sendbuffer[3] = 0x02;
            sendbuffer[4] = 0x00; sendbuffer[5] = 0x02;
            crccheck = CrcCal(sendbuffer, 6);
            sda = crccheck; StoB();
            sendbuffer[6] = ucb[0]; sendbuffer[7] = ucb[1];

            ComWrt (portNumber, sendbuffer, 8);
            if (ComRd (portNumber, buffer, 9) <= 0)
            {
                SetCtrlVal(panel, PNLZW1402_TXTMSG, "通讯超时，请正确设置仪表参数！");
            }
            else
            {
                crccheck = CrcCal(buffer, 7);
                ucb[0] = buffer[7]; ucb[1] = buffer[8];
                BtoS();
                if (sda = crccheck)
                {
                    uca[0] = buffer[3];
                    uca[1] = buffer[4];
                    uca[2] = buffer[5];
                    uca[3] = buffer[6];
                    BtoFr();
                    SetCtrlVal(panel, PNLZW1402_BGRDCUR, real);
                    SetCtrlVal(panel, PNLZW1402_TXTMSG, "成功！");
                    backvalue = real;
                }
                else
                {
                    SetCtrlVal(panel, PNLZW1402_TXTMSG, "CRC校验错误！");
                }
            }
            SetCtrlAttribute (panel, control, ATTR_DIMMED, 0);

            break;
    }
    return 0;
}

int CVICALLBACK OnLpVal (int panel, int control, int event,
        void *callbackData, int eventData1, int eventData2)
{
    float timeinterv;
    switch (event)
    {
        case EVENT_VAL_CHANGED:
            GetCtrlVal(panel, control, &timeinterv);
            SetCtrlAttribute (panel, PNLZW1402_LPTIMER, ATTR_INTERVAL,
                    timeinterv);
            break;
    }
    return 0;
}

int CVICALLBACK OnSaveExcel (int panel, int control, int event,
        void *callbackData, int eventData1, int eventData2)
{
    int fileHandle;
    int numberOfRows, i;
    Rect cellRange;
    char *logtime[2];
    float curval[2];
    //获取用户选择保存的文件名称。
    //蔡军生 2007/12/25 QQ:9073204 深圳
    //
    OPENFILENAME ofn;       // 公共对话框结构。
    TCHAR szFile[MAX_PATH]; // 保存获取文件名称的缓冲区。          
    TCHAR strDefExt[3] = "csv";
 
    // 初始化选择文件对话框。
    ZeroMemory(&ofn, sizeof(ofn));
    ofn.lStructSize = sizeof(ofn);
    //ofn.hwndOwner = m_hWnd;
    ofn.lpstrFile = szFile;
        
    //
    ofn.lpstrFile[0] = '\0';
    ofn.nMaxFile = sizeof(szFile);
    ofn.lpstrFilter = "CSV (*.csv)\0*.CSV\0Text (*.txt)\0*.TXT\0All (*.*)\0*.*\0";
    ofn.nFilterIndex = 1;
    ofn.lpstrFileTitle = NULL;
    ofn.nMaxFileTitle = 0;
    ofn.lpstrInitialDir = NULL;
    ofn.lpstrDefExt = strDefExt;
    ofn.Flags = OFN_SHOWHELP | OFN_OVERWRITEPROMPT;
    switch (event)
    {
        case EVENT_COMMIT:
            if (GetSaveFileName(&ofn))
            {
                fileHandle = OpenFile (szFile, VAL_WRITE_ONLY, VAL_TRUNCATE,
                        VAL_ASCII);
                FmtFile (fileHandle, "日期,时间,净电流(A),总电流(A)\n");
                GetNumTableRows (panel, PNLZW1402_TBLRCRD, &numberOfRows);
                cellRange.height = 1;
                cellRange.width = 2;
                for (i = 1; i <= numberOfRows; i++)
                {
                    cellRange.top = i;
                    cellRange.left = 1;
                    GetTableCellRangeVals (panel, PNLZW1402_TBLRCRD,
                            cellRange, logtime, VAL_ROW_MAJOR);
                    cellRange.left = 3;
                    GetTableCellRangeVals (panel, PNLZW1402_TBLRCRD,
                            cellRange, curval, VAL_ROW_MAJOR);

                    FmtFile (fileHandle, "%s,%s,%f[p3],%f[p3]\n", logtime[0],
                            logtime[1], curval[0], curval[1]);
                }
                FreeTableValStrings (logtime, 2);
                CloseFile (fileHandle);
            }
            break;
    }
    return 0;
}

int CVICALLBACK OnClrLog (int panel, int control, int event,
        void *callbackData, int eventData1, int eventData2)
{
    switch (event)
    {
        case EVENT_COMMIT:
            DeleteTableRows (panel, PNLZW1402_TBLRCRD, 1, -1);
            break;
    }
    return 0;
}
