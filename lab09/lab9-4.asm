%include 'in_out.asm'   ; подключение внешнего файла

section .data
msg1 db "Функция: f(x)=12x-7 ",0
result db "Результат: ",0

section .text
global _start
_start:
pop ecx
pop edx
sub ecx, 1
mov esi, 0 ; esi = 0

_process:
cmp ecx, 0
jz _end

pop eax
call atoi
call _subcalcul ; вызов подпрограммы _subcalcul
loop _process

_end:
mov eax, msg1
call sprintLF ;Вывод сообщения 'Функция: f(x)=12x-7 '
mov eax, result
call sprint   ;Вывод сообщения 'Результат: '
mov eax, esi
call iprintLF ;Результат 

call quit

; -- подпрограмма _subcalcul
_subcalcul:    
mov ebx, 12
mul ebx     ; eax = eax * ebx(12)

mov ebx, 7
sub eax, ebx ; eax = eax - ebx(7)

add esi, eax ; esi = esi + eax

ret
