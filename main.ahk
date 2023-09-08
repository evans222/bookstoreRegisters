#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;STUFF TO ADD:
;Check resolution of display and compensate if necessary


if not DirExist("C:\Program Files\AutoHotkey\v2") {
	RunWait, "powershell curl https://www.autohotkey.com/download/ahk-v2.exe -O ahk2.exe"
	RunWait, "ahk2.exe /quiet"
	RunWait, "del ahk2.exe"
}

if DirExist("C:\Program Files\AutoHotkey\v2") {
	Run %A_MyDocuments%\bookstoreRegisters\hotkeyListener.ahk
}

;Run, %A_MyDocuments%\bookstoreRegisters\loop.ahk

;Keeps freedompay minimized, exits errors
Loop
{
	IfWinExist,Freeway Commerce Connect
		WinMinimize,Freeway Commerce Connect
	IfWinExist,Not Accepted
		Send {Escape}
	IfWinExist,Tender Not Accepted
		Send {Escape}
}

;Testing Mode
;could be made more efficient if I find out how to use /c
;^!t::
;Run, cmd.exe, %A_MyDocuments%/bookstoreRegisters
;Sleep, 1000
;Send python testColorCnd.py{Enter}
;return

;^!r::Reload

;Updates and re-launches everything
;NEED to add: adapability for quitting future versions of python, perhaps fetch name somehow and then quit
;^!u:: 
;Run, cmd.exe /c "TASKKILL /FI `"IMAGENAME eq python3.10.exe`" /F" ;stops python
;Run, cmd.exe /c "git pull https://github.com/evans222/bookstoreRegisters.git",%A_MyDocuments%/bookstoreRegisters
;Sleep, 3000
;MsgBox,,Update,Pull complete.`nThis script will now reload.,5 ;timeout of 5 sec
;Reload

;return

;Starts card transaction
;Home::
;MouseClick, Left, 1650, 950 ;green payment
;Sleep, 500
;waitColor("0x1C119C", 1800, 50)
;MouseClick, Left, 1800, 50 ;credit card
;waitColor("0xCAC9C2", 1060, 710)
;MouseClick, Left, 1060, 710 ;enter
;return

;waitColor(c, xcoord, ycoord) {
;	Loop {
;		PixelGetColor,x,%xcoord%,%ycoord%
;		If(x == c) {
;			MsgBox,,,found the color
;			return
;		}
;	}
;}
