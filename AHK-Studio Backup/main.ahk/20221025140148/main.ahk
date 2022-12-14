#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;STUFF TO ADD:
;Check resolution of display and compensate if necessary


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
^!t::
MouseGetPos, xpos, ypos
PixelGetColor,c,%xpos%,%ypos%
MsgBox,,Result,%c%
return

^!r::Reload

;Updates and re-launches this script
^!u::
Run, cmd.exe /c "git pull https://github.com/evans222/bookstoreRegisters.git",%A_MyDocuments%/bookstoreRegisters
Sleep, 5000
MsgBox,,Update,Pull complete.`nThis script will now reload.,5
Reload
return

;Starts card transaction
Home::
MouseClick, Left, 1650, 950 ;green payment
waitColor("0x1D129C", 1800, 50)
MouseClick, Left, 1800, 50 ;credit card
waitColor("0xCAC9C2", 1060, 710)
MouseClick, Left, 1060, 710 ;enter
return

waitColor(color, xcoord, ycoord) {
	Loop {
		PixelGetColor,x,%xcoord%,%ycoord%
		If(x == %color%) {
			MsgBox,,,found the color
			return
		}
	}
}
