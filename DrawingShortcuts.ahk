; Script by Benjamin Lee
; Hand Pan, Brush, Eraser, Zoom In/Out
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Goto, Sus ; Start off the script suspended

Menu, Tray, Icon, trayd.ico,1
Menu, Tray, NoStandard
Menu, Tray, Add, Toggle Draw Mode, Sus
Menu, Tray, Add, 
Menu, Tray, Standard
Menu, Tray, Default, Toggle Draw Mode

PreviousTool := 0

; Functions

; Hand Pan
handPan() {
    Send, {Alt}3
    Return
}

; Hand Pan Release
handPanRelease() {
    global PreviousTool
    state := PreviousTool
    global PreviousTool := 0
    if (state == 1) {
        brush()
    } else if (state == 2) {
        eraser()
    } else {
        Send, {Alt}3
    }
    Return
}

; Brush
brush() {
    ; global PreviousTool
    ; if (PreviousTool != 1) {
    Send, {Alt}4
    global PreviousTool := 1
    ; }
    Return
}

; Eraser
eraser() {
    global PreviousTool
    if (PreviousTool != 2) {
        Send, {Alt}5
        global PreviousTool := 2
    }
    Return
}

; Zoom In
zoomIn() {
    Send, {Alt}6
    Return
}

; Zoom Out
zoomOut() {
    Send, {Alt}7
    Return
}

; Keybinds
^+z:: ; Toggle Script
    Suspend
    Goto, toggleIcon
    Sus:
    Suspend, Toggle
    toggleIcon:
    If (A_IsSuspended)
        Menu, Tray, Icon , trayd.ico,,1
    Else
        Menu, Tray, Icon , tray.ico,,1
    Return
Space:: ; Hand Pan
    handPan() 
    keywait, Space
    Return
Space Up::handPanRelease() ; Hand Pan Release
v::brush() ; Brush Tool
e::eraser() ; Eraser Tool
[::zoomIn() ; Zoom In
]::zoomOut() ; Zoom Out