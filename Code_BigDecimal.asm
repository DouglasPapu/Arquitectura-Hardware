%include "io.inc"
section .data
BD_A db "2878740.07"
BD_B db "0435624.15"
BD_C db "0000000.00"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    
    mov ecx,9    
L16:mov al, [BD_A+ecx]    
    mov bl, [BD_B+ecx]
    mov edx,0
    cmp al, '.'
    je L43
    add al, bl
           
    AAA      ;Se sumar un 6 para hace la correcion de un numero no valido en bdc
             ;por ser un numero mayor a 10
    add al,30h
    
    cmp ah,1
    jne L36      ;Si el destino > origen 
    mov edx,1
    sub ah ,dl  
    ;add al,dl

    ;Comparación si ya hay un número en [BD_C+ecx]
    
L36:xor ebx, ebx
    mov bl,[BD_C+ecx]   
    
L40:mov [BD_C+ecx], al  ;L29
    mov al,bl
    AAA 
    add al,[BD_C+ecx]
L43:mov [BD_C+ecx],al
    dec ecx
    add [BD_C+ecx],dl
    cmp ecx, 0
    jne L16
     
    
    xor edx,edx
    xor eax, eax
    ret