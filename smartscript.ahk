/*
Z. 1 - 24:
Größtenteils übernommene Grundeinstellungen
*/
;Importierter Teil shoutouts an terman van herman
#NoEnv  
/*
Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
*/
SendMode Input  
; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  
; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll, 16 
/*
this changes the icon into a little laptop thingy.
just useful for making it distinct from the others.
*/
#singleinstance force 
;so you can only run 1 script at a time and it doens't bother you about it.
#IfWinActive 
;"Voreinstellungen"

/*
; Default state of lock keys
SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
return
*/

/*
F1:
Steuerunug für Explorer, nerfige Windows hilfe suche weg.
ExplorerSteuerung, Öffnet Explorer, Switched Explorer, Schließt ihn
*/
F1::
IfWinNotExist, ahk_class CabinetWClass
	Run, explorer.exe
GroupAdd, alxexplorrers, ahk_class CabinetWClass 
;You have to make a new group for each application
;don't use the same one for all of them!
if WinActive("ahk_exe explorer.exe")
	GroupActivate, alxexplorrers, r
else
	WinActivate ahk_class CabinetWClass 
;you have to use WinActivatebottom if you didn't create a window group.
Return

;strg + f1 schließt explorer wieder
^F1::
IfWinExist, ahk_class CabinetWClass
	WinClose, ahk_class CabinetWClass
Return
;F1 WORKS FINE!


;F2 ist rename, daher ausgelassen

/*
F3:
Chromesteuerung, opens shrome, switshes tabs, closes chrome
STRG+F3: Close Chrome
*/
F3::
IfWinNotExist, ahk_exe chrome.exe
	Run, chrome.exe
if WinActive("ahk_exe chrome.exe")
	Send ^{tab}
else
	WinActivate,  ahk_exe chrome.exe
Return
;Close Chrome
^F3::
IfWinExist, ahk_exe chrome.exe
	WinClose, ahk_exe chrome.exe
Return
;F3 Working!

/*
F4:
Shell Control, switches shells, closes shell
STRG+F4: Close Promt
*/
F4::
IfWinNotExist, ahk_class ConsoleWindowClass
	Run, C:\Windows\System32\cmd.exe /K "cd C:\Users\alzudemX\Desktop\"
GroupAdd, alxshells, ahk_class ConsoleWindowClass
if WinActive("ahk_class ConsoleWindowClass")
	GroupActivate, alxshells
else
	WinActivate ahk_class ConsoleWindowClass  
Return
;Close Shell
^F4::
IfWinExist, ahk_exe cmd.exe
	WinClose, ahk_exe cmd.exe
Return
;F4 Works Fine!

/*
Super Googlefunktion!!!
Benutzung mit F6
Kleiner Bug: Bei der  ersten benutzung funktioniert es nciht richtig
*/
F6::
clipboard = 
SendInput {CTRLDOWN}c{CTRLUP}
ClipWait
Run http://www.google.com/search?hl=en&q=%clipboard%,, UseErrorLevel
Return

/*
03.04.2018
Neue Funktionen
*/

/*
WIN + E 
Öffnet Explorer an engegebenen Pfad
(mein computer)
Rauskommentiert, wird nicht benuzt derzeit
*/
/*
#e::
Run explorer.exe {Dieser PC}
return
*/

/*
Mittlerer Mausknopf bringt einen ein verzeichnis höher wen 
ein explorer geöfnet, bzw aktiv ist
*/
#IfWinActive, ahk_class CabinetWClass
~MButton::Send !{Up} 
#IfWinActive
return

/*
Bringt gewähltes fesnter "immer" in den hintergrund
WIN + SPACE
suspendiert wechsel von sprachen
*/
; Always on Top
#SPACE:: Winset, Alwaysontop, , A ; win + space
Return

/*
WIN + rollen
Pausiert ahk script
*/
; Suspend AutoHotKey
#ScrollLock::Suspend ; Win + scrollLock
return

/*
open in new tab on middle mouse
*/
^-::
Send, "^{Click}"

/*
smartscript by 3zbumban
& the internet community
*/
