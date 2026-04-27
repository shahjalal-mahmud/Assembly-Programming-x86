.model small
.stack 100h
.data
    m1 db '1st input: $'
    m2 db 13, 10, '2nd input: $'
    m3 db 13, 10, '3rd input: $'
    res db 13, 10, 'Maximum: $'
    max db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; --- Input 1st Number ---
    lea dx, m1
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    mov bl, al      ; BL stores the first number

    ; --- Input 2nd Number ---
    lea dx, m2
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    mov cl, al      ; CL stores the second number

    ; --- Input 3rd Number ---
    lea dx, m3
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    mov ch, al      ; CH stores the third number

    ; --- Compare 1st and 2nd ---
    cmp bl, cl      ; Compare BL and CL
    jg compare_third ; If BL > CL, go compare BL with CH
    mov bl, cl      ; Otherwise, CL is bigger, move it to BL

compare_third:
    ; --- Compare the winner (BL) with 3rd (CH) ---
    cmp bl, ch
    jg print_result ; If BL is still bigger, go to print
    mov bl, ch      ; Otherwise, CH is the biggest

print_result:
    lea dx, res
    mov ah, 09h
    int 21h

    mov dl, bl      ; BL now holds the maximum value
    mov ah, 02h
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h
main endp
end main