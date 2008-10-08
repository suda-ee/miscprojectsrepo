/**************************************************************************/
/* LabWindows/CVI User Interface Resource (UIR) Include File              */
/* Copyright (c) National Instruments 2008. All Rights Reserved.          */
/*                                                                        */
/* WARNING: Do not add to, delete from, or otherwise modify the contents  */
/*          of this include file.                                         */
/**************************************************************************/

#include <userint.h>

#ifdef __cplusplus
    extern "C" {
#endif

     /* Panels and Controls: */

#define  PNLZW1402                        1       /* callback function: OnPnl1402 */
#define  PNLZW1402_COMSEL                 2
#define  PNLZW1402_QUITBUTTON             3       /* callback function: QuitCallback */
#define  PNLZW1402_BAUDRATESEL            4
#define  PNLZW1402_CURRENTNUM             5
#define  PNLZW1402_LED                    6
#define  PNLZW1402_RELCURSWTCH            7       /* callback function: OnRelCurSel */
#define  PNLZW1402_BGRDCUR                8
#define  PNLZW1402_GETBGRDCUR             9       /* callback function: OnGetBgr */
#define  PNLZW1402_IADDR                  10
#define  PNLZW1402_MEASURE                11      /* callback function: OnTest */
#define  PNLZW1402_LOOPMEASURE            12      /* callback function: OnLoopSel */
#define  PNLZW1402_LOOPTIME               13      /* callback function: OnLpVal */
#define  PNLZW1402_TEXTMSG                14
#define  PNLZW1402_LPTIMER                15      /* callback function: OnLpTime */
#define  PNLZW1402_SPLITTER               16
#define  PNLZW1402_TXTMSG                 17
#define  PNLZW1402_LEDZONG                18
#define  PNLZW1402_LEDJING                19
#define  PNLZW1402_TBLRCRD                20
#define  PNLZW1402_SVEXCEL                21      /* callback function: OnSaveExcel */
#define  PNLZW1402_CLRLOG                 22      /* callback function: OnClrLog */


     /* Menu Bars, Menus, and Menu Items: */

          /* (no menu bars in the resource file) */


     /* Callback Prototypes: */ 

int  CVICALLBACK OnClrLog(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK OnGetBgr(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK OnLoopSel(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK OnLpTime(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK OnLpVal(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK OnPnl1402(int panel, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK OnRelCurSel(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK OnSaveExcel(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK OnTest(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK QuitCallback(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);


#ifdef __cplusplus
    }
#endif
