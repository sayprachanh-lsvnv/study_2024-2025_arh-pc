%include 'in_out.asm'

section .data
filename db 'name.txt', 0h
msg1 db 'Как Вас зовут?', 0h
msg2 db 'Меня зовут ', 0h


section .bss
name resb 255

section .text
global _start
_start:

mov eax, msg1
call sprintLF


mov ecx, name
mov edx, 255
call sread


mov eax, 8
mov ebx, filename
mov ecx, 0744o
int 80h

mov esi, eax


mov eax, msg2
call slen
mov edx, eax
mov ecx, msg2
mov ebx, esi
mov eax, 4
int 80h


mov eax, name
call slen
mov edx, eax
mov ecx, name
mov ebx, esi
mov eax, 4
int 80h

mov ebx, esi
mov eax,  6
int 80h

call quit 
