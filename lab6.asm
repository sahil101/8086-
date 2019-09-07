.model small
.data
m1 db 10,13,"enter the number $"
m2 db 10,13,"0 1 $"
n db ?
a db ?
b db ?
c db ?
.code 
mov ax,@data
mov ds,ax
lea dx,m1
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
mov bl,al
mov ah,01h
int 21h
sub al,30h
mov ah,bl
aad
mov n,al
mov cx,00h
mov cl,n
dec cl
dec cl
mov a,00d
mov b,01d
l3:mov al,a
add al,b
mov c,al
mov dl,c
mov di,cx
call display
mov ch,b
mov cl,c
mov a,ch
mov b,cl
mov cx,di
loop l3

mov ah ,4ch
int 21h

display proc near
mov ax,00h
mov al,dl
mov bx,10d
mov cx,00h
l1:mov dx,00h
div bx
push dx
inc cx
cmp ax,00h
jnz l1
l2:pop dx
add dl,30h
mov ah,02h
int 21h
loop l2

mov dl,' '
mov ah,02h
int 21h
ret 
display endp 
end