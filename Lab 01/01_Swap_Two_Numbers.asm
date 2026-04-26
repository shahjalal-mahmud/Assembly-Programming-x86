.model small
.stack 100h
.data
    a db 5
    b db 8
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov al, a
    mov bl, b
    
    ; --- The 3-Step Swap ---
    add al, bl      ; AL = 13
    sub bl, al      ; BL = -5
    neg bl          ; BL = 5
    sub al, bl      ; AL = 8 (Swap complete!)
    
    ; --- Print First Number (AL which is now 8) ---
    mov dl, al      ; Move 8 to DL
    add dl, 48      ; Convert 8 to ASCII '8'
    mov ah, 2
    int 21h
    
    ; --- Print Second Number (BL which is now 5) ---
    mov dl, bl      ; Move 5 to DL
    add dl, 48      ; Convert 5 to ASCII '5'
    mov ah, 2
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main