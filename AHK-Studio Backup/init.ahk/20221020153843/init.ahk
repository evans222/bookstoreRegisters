#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;BEFORE USING:
;Install git
;clone repository into documents


;need to use pull command

MsgBox,4,init.ahk,Yes - Update script and launch`nNo - Just update,10
IfMsgBox, Yes
{
	MsgBox,,,the box was yes
	Run, cmd.exe /c "git pull https://github.com/evans222/bookstoreRegisters.git",%A_MyDocuments%/bookstoreRegisters
	Sleep, 5000
	Run %A_MyDocuments%\bookstoreRegisters\main.ahk
	ExitApp	
}


MsgBox,,,the box was no
Run, cmd.exe /c "git pull https://github.com/evans222/bookstoreRegisters.git",%A_MyDocuments%/bookstoreRegisters
ExitApp



