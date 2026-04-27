.model small
.stack 100h
.data
a db ?
b db ?
c db ?
d db "The First Initial $"
e db "The Second Initial $"
f db "The Third Initial $"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, d
    mov ah, 09h
    int 21h
    
    mov ah, 1
    int 21h
    mov a, al
    
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    lea dx, e
    mov ah, 09h
    int 21h
    
    mov ah, 1
    int 21h
    mov b, al 
    
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    lea dx, f
    mov ah, 09h
    int 21h
    
    mov ah, 1
    int 21h
    mov c, al 
    
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    mov ah, 2
    mov dl, a
    int 21h
    
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    mov ah, 2
    mov dl, b
    int 21h
    
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    
    mov ah, 2
    mov dl, c
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main
    
    