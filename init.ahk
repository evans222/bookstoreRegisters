#Requires AutoHotkey v2.0

usrJunk := MsgBox("Yes - Update script and launch`nNo - Just update","init.ahk","YesNo T5")
if(usrJunk = "Timeout" || usrJunk = "Yes") {
    RunWait A_ComSpec ' /c git pull https://github.com/evans222/bookstoreRegisters.git'
} else {
    RunWait A_ComSpec ' /c git pull https://github.com/evans222/bookstoreRegisters.git'
}

Sleep 3000
Run "%A_MyDocuments%\bookstoreRegisters\main.ahk"