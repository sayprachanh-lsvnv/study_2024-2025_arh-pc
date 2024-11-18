%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db 'Введите a: ',0h
msg_result db 'Результат: ',0h

section .bss
result resb 10
x resb 10
a resb 10
section .text
global _start
_start:
; -- x
mov eax, msg1
call sprint
mov ecx, x
mov edx, 10
call sread
;--- a
mov eax, msg2
call sprint
mov ecx, a
mov edx, 10
call sread

;-------------
mov eax, x
call atoi
mov [x], eax

mov eax, a
call atoi
mov [a], eax

; --------------
mov eax, [a]
mov ebx, 7
cmp eax, ebx
jge cal_1
mov ebx, [x]
mul ebx
jmp fin

cal_1:
mov ebx, 7
sub eax, ebx


fin:
mov [result], eax
mov eax, msg_result
call sprint
mov eax, [result]
call iprintLF
call quit
