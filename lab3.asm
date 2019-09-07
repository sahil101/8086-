.model small
.data
m1 db 10,13,"enter the 8-bit number $"
m2 db 10 ,13 ,"number is prime $"
m3 db 10,13 ,"the number is not prime$"
num db ?
count db 00h
.code 
mov ax,@data
mov ds,ax
lea dx,m1
mov ah,09h
int 21h
call read8
mov num ,al
mov cl,al
mov ch,00h
mov bl,01h
l3:mov ah,00h
div bl
cmp ah,00h
jz l1
jmp l2
l1:inc count
l2:inc bl
mov al,num
dec cx
jnz l3

cmp count,02h
jz l4
lea dx,m3
mov ah,09h
int 21h
jmp final
l4:lea dx,m2
mov ah,09h
int 21h
final:mov ah,4ch
int 21h
read8 proc near
mov ah,01h
int 21h
sub al,30h
mov bh,al
mov ah,01h
int 21h
mov ah,bh
aad
ret
read8 endp
end

