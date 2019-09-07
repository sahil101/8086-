.model small
.data
m1 db 10,13,"string 1 : $"
buff1 db 100
len1 db ?
str1 db 100 dup(?)
m2 db 10,13,"string 2 : $"
buff2 db 100
len2 db ?
str2 db 100 dup(?)
m3 db 10,13,"length of string 1 : $"
m4 db 10,13,"length of string 2 : $"
m5 db 10,13,"strings are palindrome $"
m6 db 10,13,"strings are not palindrome $"
.code 
mov ax,@data
mov ds,ax
mov es,ax
lea dx,m1
mov ah,09h
int 21h
lea dx,buff1
mov ah,0ah
int 21h
lea dx,m2
mov ah,09h
int 21h
lea dx,buff2
mov ah,0ah
int 21h
mov al,len1
cmp al,len2
jnz notequal
lea si,str1
lea di,str2
mov cl,len1
mov ch,00h
cld 
repe cmpsb
jz equal

notequal:lea dx,m6
mov ah,09h
int 21h
jmp exit

equal:lea dx,m5
mov ah,09h
int 21h

exit:lea dx,m3
mov ah ,09h
int 21h
mov dl,len1
call printl
lea dx,m4
mov ah,09h
int 21h
mov dl,len2
call printl
mov ah,4ch
int 21h

printl proc near
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
dec cx
jnz l2
ret
printl endp
end 