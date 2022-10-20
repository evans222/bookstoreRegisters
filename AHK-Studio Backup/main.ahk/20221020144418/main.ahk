#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Run, %A_MyDocuments%\bookstoreRegisters\loop.ahk
Loop
{
	MsgBox,,Checking for window
	IfWinExist,Freeway Commerce Connect
		WinMinimize,Freeway Commerce Connect
	Sleep, 5000
}
F8::
MsgBox,,hot,function key was pressed
return

;this is a test comment, nothing moreeeeeeee
