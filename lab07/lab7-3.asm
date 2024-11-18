%include 'in_out.asm'    

section .data
    msg1 db 'Введите a: ', 0h
    msg2 db 'Введите b: ', 0h
    msg3 db 'Введите c: ', 0h
    msg_result db 'Наименьшее число: ', 0h

section .bss
    a resb 10               
    b resb 10                
    c resb 10               
    min resb 10             

section .text
global _start
_start:

; -- a
mov eax, msg1
call sprint

mov ecx, a
mov edx, 10
call sread

; -- b
mov eax, msg2
call sprint

mov ecx, b
mov edx, 10
call sread

; -- c
mov eax, msg3
call sprint

mov ecx, c
mov edx, 10
call sread

mov eax, a
call atoi
mov [a], eax

mov eax, b
call atoi
mov [b], eax

mov eax, c
call atoi
mov [c], eax

; --
mov eax, [a] ; eax = a
mov ebx, [b] ;ebx = b
cmp eax, ebx  
jl compare_bc ; если a < c
mov eax, ebx ; eax = ebx (b)

compare_bc:
mov ebx, [c]
cmp eax, ebx
jle fin ; если min(a,b) <= c
mov eax, ebx

fin:
mov [min], eax
mov eax, msg_result ; Вывод сообщения 'Наименьшее число: '
call sprint
mov eax, [min]
call iprintLF
call quit
