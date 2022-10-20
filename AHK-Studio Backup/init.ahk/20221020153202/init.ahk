#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;BEFORE USING:
;Install git
;clone repository into documents


;need to use pull command

Run, cmd.exe /c "git pull https://github.com/evans222/bookstoreRegisters.git",%A_MyDocuments%/bookstoreRegisters
Sleep, 5000
Run %A_MyDocuments%\bookstoreRegisters\main.ahk