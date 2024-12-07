 %include 'in_out.asm'

 SECTION .data
 div: DB 'Результат: ',0

 SECTION .text
 GLOBAL _start
 _start:

 ;---- Вычисление выражения (3+2)*4+5
 mov ebx,3
 mov eax,2
 add eax,ebx ; от (add ebx, eax)
 mov ecx,4
 mul ecx
 add eax,5 ; от (add ebx, 5)
 mov edi,eax ; от (mov edi, ebx)

;---- Вывод результата на экран
 mov eax,div
 call sprint
 mov eax,edi
 call iprintLF

 call quit
