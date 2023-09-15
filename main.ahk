#Requires AutoHotkey v2.0

^F12::
{
    ProcessClose "NetSuite.Retail.POS.PointOfSale.exe"
    MsgBox "Starting NSPOS","Please wait...","T5"
    Sleep 1000
    Run "C:\ProgramData\Microsoft\Windows\Start Menu\NetSuite Point of Sale.lnk"
}

Sleep 5000

Loop
{
    freeWindow := WinActive("Freeway Commerce Connect")
    acctWindow := WinExist("Not Accepted")
    actvWindow := WinActive("Permission Required","has an active session")
    ;timeWindow := WinActive("Permission Required","Your session has timed out") possibility later, but might violate policies

    if (freeWindow != 0) {
        WinMinimize "Freeway Commerce Connect"
    }
    if (acctWindow != 0) {
        WinActivate
        Send "{Escape}"
    }

    if (actvWindow != 0) {
        BlockInput 1
        Sleep 500
        Send "eschoening{Tab}Eight88%{Enter}"
        Sleep 1000
        BlockInput 0
        Sleep 5000
    }

}