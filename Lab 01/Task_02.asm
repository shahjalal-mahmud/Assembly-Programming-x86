.model small
.stack 100h

.data
    a db 2
    b db 3
    c db 8
    msg db 'The result is: $'  ; String ending with $ for display

.code
main proc
    ; Initialize Data Segment
    mov ax, @data
    mov ds, ax
    
    ; Perform Calculation: Result = c - (a + b)
    mov al, a        ; AL = 2
    mov bl, b        ; BL = 3
    add al, bl       ; AL = 5 (Sum of a + b)
    
    mov cl, c        ; CL = 8
    sub cl, al       ; CL = 8 - 5 = 3
    
    ; Display the Message String
    lea dx, msg      ; Load address of msg
    mov ah, 09h      ; Function 9 prints strings
    int 21h
    
    ; Display the Resulting Digit
    mov dl, cl       ; Move result to DL
    add dl, 48       ; Convert raw number 3 to ASCII '3'
    mov ah, 02h      ; Function 2 prints a single character
    int 21h
    
    ; Exit Program
    mov ah, 4ch
    int 21h
main endp
end main