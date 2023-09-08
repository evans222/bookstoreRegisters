#Requires AutoHotkey v2.0
SetWorkingDir A_InitialWorkingDir

; if powershell (from MS store) is not installed, install it via CMD
if not DirExist("C:\Program Files\PowerShell\7\") {
    try
        RunWait "winget install Microsoft.Powershell --force --silent --accept-package-agreements --accept-source-agreements"
    catch
        MsgBox "Failed to install Powershell"
}


Hotkey "^+f", showFixer

showFixer(ThisHotKey) {
    FixerGui := Gui(,"Fix it Felix",)
    sometext := FixerGui.Add("Text", "w200", "Uh oh, what happened?")
    crashButton := FixerGui.Add("Button", "w100", "Register Crashed!").OnEvent('Click', crashClick)
    lockedButton := FixerGui.Add("Button", "w100", "I'm locked out").OnEvent('Click', lockedClick)
    FixerGui.Show("w200")
}

crashClick(*) {
    Run "C:\Program Files\PowerShell\7\pwsh.exe nsposFixer.ps1 0" 
}

lockedClick(*) {
    Run "C:\Program Files\PowerShell\7\pwsh.exe nsposFixer.ps1 0"
}