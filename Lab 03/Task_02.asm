.model small
.stack 100h
.data
    m1 db '1st input: $'
    m2 db 13, 10, '2nd input: $'
    msg1 db 13, 10, 'Divisible$'
    msg2 db 13, 10, 'Not divisible$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; --- 1. Get 1st Input ---
    lea dx, m1
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, 48       ; Convert ASCII to number
    mov bl, al       ; Store in BL

    ; --- 2. Get 2nd Input ---
    lea dx, m2
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, 48       ; Convert ASCII to number

    ; --- 3. Multiplication ---
    mul bl           ; AL = AL * BL (Result in AX)
    
    ; --- 4. Divisibility Check (Divide by 6) ---
    mov bl, 6
    div bl           ; AX / 6 -> Quotient in AL, Remainder in AH
    
    ; --- 5. If-Else Logic ---
    cmp ah, 0        ; Check if remainder is 0
    je is_divisible  ; Jump if Equal to zero
    
    ; --- ELSE: Not Divisible ---
    lea dx, msg2
    mov ah, 09h
    int 21h
    jmp exit_prog

is_divisible:
    ; --- IF: Divisible ---
    lea dx, msg1
    mov ah, 09h
    int 21h

exit_prog:
    mov ah, 4ch
    int 21h
main endp
end main