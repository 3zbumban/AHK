#NoEnv
#Persistent
#SingleInstance, force

SetMouseDelay, 10

SendMode, event

 

 

f12:: ;<- use the f12 key to start/stop the clicking routine
clicktoggle := !clicktoggle
if (!clicktoggle)
{ SetTimer, startclick, off
  tooltip
  return
}

; drops through into the click timer
startclick:
tooltip, auto repeat is on
Send {NumpadDot}
SetTimer, startclick, -19000
return

Esc:: Exitapp ;<- use the esc key to end the script