.model small
.stack 100h
.data
    prompt db 'Enter month digit (1-6): $'
    days31 db 13, 10, '31$'
    days30 db 13, 10, '30$'
    days28 db 13, 10, '28$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; --- 1. Get Input ---
    lea dx, prompt
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    ; Input character is now in AL (e.g., '4')

    ; --- 2. Check for February (Digit 2) ---
    cmp al, '2'
    je print28

    ; --- 3. Check for 30-day months (April=4, June=6) ---
    cmp al, '4'
    je print30
    cmp al, '6'
    je print30

    ; --- 4. Default to 31 days (1, 3, 5) ---
    ; (Assuming user follows instructions and only inputs 1-6)
    lea dx, days31
    mov ah, 09h
    int 21h
    jmp exit

print30:
    lea dx, days30
    mov ah, 09h
    int 21h
    jmp exit

print28:
    lea dx, days28
    mov ah, 09h
    int 21h

exit:
    mov ah, 4ch
    int 21h
main endp
end main