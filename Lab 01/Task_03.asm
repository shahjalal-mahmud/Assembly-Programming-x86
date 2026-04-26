.model small
.stack 100h
.data
    x db 4
    y db 2
    z db 3
    result db ?
    msg db 'Result of (4/2)*3 = $'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; --- Step 1: Division (X / Y) ---
    mov al, x        ; AL = 4
    mov ah, 0        ; CRITICAL: Clear AH to make AX = 4
    div y            ; AX / y (4/2=2), Quotient in AL, Remainder in AH
    
    ; --- Step 2: Multiplication (Quotient * Z) ---
    mov bl, z        ; BL = 3
    mul bl           ; AL * BL = 2 * 3 = 6, result in AX
    mov result, al   ; Store final result (6)

    ; --- Step 3: Display Logic ---
    lea dx, msg
    mov ah, 09h
    int 21h

    ; Convert result to ASCII
    mov dl, result
    add dl, 48       ; Convert to ASCII (6 → '6')
    mov ah, 02h
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main