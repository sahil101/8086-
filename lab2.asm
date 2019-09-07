.model small
.data
m1 db 10,13,"enter the ascii character $"
m2 db  "ascii value is $"
.code 
mov ax,@data
mov ds,ax
mov ah,06h
mov al,0d
mov cx,00h
mov bh,0ceh
mov dh,24d
mov dl,79d
int 10h
lea dx,m1
mov ah,09h
int 21h

mov ah,01h
int 21h

mov ah,00h
mov cx,00h
mov bx,10d
l1:mov dx,00h
div bx
push dx
inc cx
cmp ax,00h
jnz l1

mov ah,02h
mov bh,0h
mov dh,12d
mov dl,39d
int 10h
lea dx,m2
mov ah,09h
int 21h
l2:pop dx
add dl,30h
mov ah,02h
int 21h
loop l2 

mov ah,4ch
int 21h
end 