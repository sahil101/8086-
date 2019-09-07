.model small
.data
buff db 10
l db ?
str db 10 dup(?)
rstr db 10 dup(?)
m1 db 10,13,"enter the string $"
m2 db 10,13,"the reversed string is $"
m3 db 10,13,"strings are palindrome $"
m4 db 10,13,"strings are not palindrome $"
.code
mov ax,@data
mov ds,ax
mov es,ax
lea dx,m1
mov ah,09h
int 21h
lea dx,buff
mov ah,0ah
int 21h
lea si,str
lea di,rstr
mov cx,00h
mov cl,l
add si,cx
dec si
l1:mov al,[si]
mov [di],al
inc di
dec si
dec cx
jnz l1

inc di
mov al,'$'
mov [di],al
lea dx,m2
mov ah,09h
int 21h
lea dx,rstr
mov ah,09h
int 21h

lea di,rstr
lea si,str
mov cl,l
mov ch,00h
cld 
repe cmpsb
jnz notequal
lea dx,m3
mov ah,09h
int 21h
jmp exit
notequal:lea dx,m4
mov ah,09h
int 21h
exit:mov ah,4ch
int 21h
end