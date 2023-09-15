;DO NOT make any major changes to this file if you want everything to work remotely
;Init pulls, then starts main. If it pulls different stuff, main will be changed but init will not run again with new version
;Main will update on the first pass

#Requires AutoHotkey v2.0

usrJunk := MsgBox("Yes - Update script and launch`nNo - Just update","init.ahk","YesNo T5")
if(usrJunk = "Timeout" || usrJunk = "Yes") {
    RunWait A_ComSpec ' /c git pull https://github.com/evans222/bookstoreRegisters.git'
} else {
    RunWait A_ComSpec ' /c git pull https://github.com/evans222/bookstoreRegisters.git'
}

Sleep 3000
Run A_MyDocuments "\bookstoreRegisters\main.ahk"
