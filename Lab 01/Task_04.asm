.model small
.stack 100h
.data
    result db ?
    msg db 'Result = $'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; --- Part 1: (3+4) * (3-2) ---
    ; (7 * 1) = 7
    mov al, 7        
    
    ; --- Part 2: / 5 ---
    mov ah, 0        ; CRITICAL: Clear AH before division
    mov bl, 5
    div bl           ; AX / 5 -> Quotient in AL (1), Remainder in AH (2)
    
    ; --- Part 3: + 2 + 2 ---
    add al, 2        ; 1 + 2 = 3
    add al, 2        ; 3 + 2 = 5
    
    ; --- Part 4: - (1 * 2) ---
    sub al, 2        ; 5 - 2 = 3
    
    mov result, al
    
    ; --- Display ---
    lea dx, msg
    mov ah, 09h
    int 21h
    
    mov dl, result
    add dl, 48       ; Convert 3 to ASCII '3'
    mov ah, 02h
    int 21h
    
    ; Exit
    mov ah, 4ch
    int 21h
main endp
end main