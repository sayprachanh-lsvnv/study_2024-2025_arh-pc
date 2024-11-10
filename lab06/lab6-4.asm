%include 'in_out.asm' 
 SECTION .data
 msg: DB 'Введите значение х: ',0
 rem: DB 'Результат: ',0
 SECTION .bss
 x: RESB 80
 SECTION .text 
 GLOBAL _start
 _start:
 ;---- Вычисление выражения
 mov eax, msg 
 call sprint
 
 mov ecx, x 
 mov edx, 80
 call sread
 mov eax,x
 call atoi
 mov ebx,8 
 mul ebx
 
 add eax,6
 
 mov ebx,10
 mul ebx
 
 mov edi,eax
 ;---- Вывод результата
 mov eax,rem
 call sprint 
 mov eax,edi 
 call iprintLF
 call quit
