.model small
.stack 100h
.data
    m1 db '1st side: $'
    m2 db 13, 10, '2nd side: $'
    m3 db 13, 10, '3rd side: $'
    res db 13, 10, 'Result: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; --- 1. Input Side 1 ---
    lea dx, m1
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    mov bl, al      ; BL = side 1

    ; --- 2. Input Side 2 ---
    lea dx, m2
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    mov cl, al      ; CL = side 2

    ; --- 3. Input Side 3 ---
    lea dx, m3
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    mov ch, al      ; CH = side 3

    ; --- 4. Logic: (S1 == S2) OR (S2 == S3) OR (S3 == S1) ---
    
    cmp bl, cl      ; Check S1 == S2
    je is_isosceles ; If equal, it is isosceles
    
    cmp cl, ch      ; Check S2 == S3
    je is_isosceles ; If equal, it is isosceles
    
    cmp bl, ch      ; Check S1 == S3
    je is_isosceles ; If equal, it is isosceles

    ; --- ELSE: Not Isosceles ---
    lea dx, res
    mov ah, 09h
    int 21h
    
    mov dl, 'N'
    mov ah, 02h
    int 21h
    jmp exit_prog

is_isosceles:
    ; --- IF: Isosceles ---
    lea dx, res
    mov ah, 09h
    int 21h
    
    mov dl, 'Y'
    mov ah, 02h
    int 21h

exit_prog:
    mov ah, 4ch
    int 21h
main endp
end main