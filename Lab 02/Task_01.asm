.model small
.stack 100h

.data
    a db ?
    b db ?
    msg db "The result is $"

.code 
main proc
    mov ax, @data
    mov ds, ax

    ; --- 1st Input ---
    mov ah, 1        ; Function to read a character
    int 21h
    sub al, 48       ; Convert ASCII to number
    mov a, al        ; Store it in 'a'

    ; --- 2nd Input ---
    mov ah, 1
    int 21h
    sub al, 48       ; Convert ASCII to number
    mov b, al        ; Store it in 'b'

    ; --- Multiplication ---
    mov al, a
    mul b            ; AL = AL * b. Result is in AL
    mov a, al        ; Store result back in 'a'

    ; --- Print Message ---
    ; New Line (Carriage Return + Line Feed)
    mov ah, 2
    mov dl, 13       ; Carriage return
    int 21h
    mov dl, 10       ; Line feed
    int 21h

    lea dx, msg      ; Print "The result is"
    mov ah, 09h
    int 21h

    ; New Line before result
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    ; --- Print Result ---
    mov dl, a
    add dl, 48       ; Convert number back to ASCII
    mov ah, 2
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h
main endp
end main