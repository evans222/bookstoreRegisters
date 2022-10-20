#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
MsgBox,,Done,Done
Loop
{
	IfWinExist,Freeway Commerce Connect
		WinMinimize,Freeway Commerce Connect
}

;this is a test comment, nothing moree
