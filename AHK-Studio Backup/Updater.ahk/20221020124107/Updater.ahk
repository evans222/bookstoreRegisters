#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;https://github.com/evans222/bookstoreRegisters.git
;need to use pull command
run, cmd.exe /k "tree"
;Run, cmd.exe "tree"
;Run, cmd.exe "https://github.com/evans222/bookstoreRegisters.git",%A_MyDocuments%, ;Min