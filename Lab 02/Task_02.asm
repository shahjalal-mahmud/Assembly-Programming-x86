.model small
.stack 100h
.data
    char db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; --- 1. Take Input ---
    mov ah, 1        ; Function to read a character
    int 21h          ; Character is stored in AL
    mov char, al     ; Save the input character

    ; --- 2. Convert to Lowercase ---
    ; Rule: Lowercase = Uppercase + 32
    add char, 32

    ; --- 3. Move to Next Line & Next Position ---
    ; Carriage Return (Move to start of line)
    mov ah, 2
    mov dl, 13
    int 21h
    ; Line Feed (Move to next line)
    mov dl, 10
    int 21h

    ; --- 4. Display the Lowercase Character ---
    mov dl, char
    mov ah, 2
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h
main endp
end main