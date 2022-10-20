#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Run, %A_MyDocuments%\bookstoreRegisters\loop.ahk

;Keeps freedompay minimized
Loop
{
	IfWinExist,Freeway Commerce Connect
		WinMinimize,Freeway Commerce Connect
}

;Updates and re-launches this script
^!u::
Run, cmd.exe /c "git pull https://github.com/evans222/bookstoreRegisters.git",%A_MyDocuments%/bookstoreRegisters
Sleep, 5000
Reload
return

Home::

return