
; Hand Pan, Brush, Eraser, Zoom In/Out

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
^+z::Suspend ; Toggle Script
Space:: ; Hand Pan
    handPan() 
    keywait, Space
    Return
Space Up::handPanRelease() ; Hand Pan Release
v::brush() ; Brush Tool
e::eraser() ; Eraser Tool
[::zoomIn() ; Zoom In
]::zoomOut() ; Zoom Out