.model small
.data 
A db 10d,20d,30d,40d,50d
len dw $-A
m1 db 10,13,"key is found $"
m2 db 10,13,"key is not found $"
key db 40d
.code
mov ax,@data
mov ds,ax
mov bx,len
dec bx
n1:mov cx,bx
   lea si,A
n2:mov al,[si]
   inc si
   cmp al,[si]
   jbe noswap
   xchg al,[si]
   mov [si-1],al
noswap:loop n2
dec bx
jnz n1
lea si,A
mov di,si
add di,len
dec di
l1:cmp si,di
ja nf
mov bx,si
add bx,di
shr bx,01h
mov al,key
cmp al,[bx]
jz  found
jb  nlow
mov si,bx
inc si
jmp l1
nlow:mov di ,bx
dec di
jmp l1
nf : lea dx,m2
jmp final
found:lea dx,m1
final : mov ah,09h
	int 21h

mov ah,4ch
int 21h 
end