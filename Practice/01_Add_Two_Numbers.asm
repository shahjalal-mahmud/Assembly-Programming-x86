.model small
.stack 100h

.data
    num1 db 5
    num2 db 3

.code
main proc
         mov ax, @data
         mov ds, ax

         mov al, num1
         add al, num2

         add al, 48

         mov ah, 2
         mov dl, al
         int 21h

         mov ah, 4ch
         int 21h
main endp
end main