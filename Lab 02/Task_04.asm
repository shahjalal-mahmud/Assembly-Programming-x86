.model small
.stack 100h
.data
    m1 db 'ENTER A HEX DIGIT: $'
    m2 db 13, 10, 'IN DECIMAL IT IS 1$' ; The '1' is hardcoded here

.code
main proc
    mov ax, @data
    mov ds, ax

    ; 1. Print first message
    lea dx, m1
    mov ah, 09h
    int 21h

    ; 2. Read Hex Digit (e.g., 'C')
    mov ah, 01h
    int 21h
    ; Result is in AL. Let's move it to BL to keep it safe.
    mov bl, al

    ; 3. Print second message (includes the '1')
    lea dx, m2
    mov ah, 09h
    int 21h

    ; 4. Calculate second digit
    ; If input is 'A' (65), we want to print '0' (48)
    ; If input is 'C' (67), we want to print '2' (50)
    ; The difference is always 17 (65 - 17 = 48)
    sub bl, 17

    ; 5. Print the second digit
    mov dl, bl
    mov ah, 02h
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h
main endp
end main