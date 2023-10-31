#Requires AutoHotkey v2.0

SetWorkingDir A_ScriptDir

^F1::
{
    MsgBox "Combine CTRL with all FN keys:`n`nF1 - Help menu`nF2 - Restart NSPOS services`nF3 - Restart FreedomPay services`nF4 - Shutdown NSPOS`nF11 - Update from GitHub`nF12 - Restart NSPOS","List of Hotkeys"
}

^F2::
{
    Run A_ComSpec ' /c powershell -Command "Start-Process restart_nspos_services.bat -Verb RunAs"'
}

^F3::
{
    Run A_ComSpec ' /c powershell -Command "Start-Process restart_freedompay_services.bat -Verb RunAs"'
}

^F4::
{
    ProcessClose "NetSuite.Retail.POS.PointOfSale.exe"
}

^F11::
{
    RunWait A_ComSpec ' /c git pull https://github.com/evans222/bookstoreRegisters.git --force'
    Sleep 1000
    Reload
}

^F12::
{
    ProcessClose "NetSuite.Retail.POS.PointOfSale.exe"
    Sleep 1000
    Run "C:\ProgramData\Microsoft\Windows\Start Menu\NetSuite Point of Sale.lnk"
    MsgBox "Starting NSPOS","Please wait...","T5"
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
        Send "eschoening{Tab}Eight88^{Enter}"
        Sleep 1000
        BlockInput 0
        Sleep 5000
    }

}