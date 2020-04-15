%include "io.inc"

section .data
BD_A db "2878740.07"
BD_B db "0435624.15"
BD_C db "0000000.00"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax ;se limpian los registros 
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    
    mov ecx,9   
L16:mov al,[BD_A+ecx]
    cmp dl,1
    je L31              ; en caso de que haya acarreo salta a la etiqueta L31
L54:mov bl,[BD_B+ecx]  
    cmp al,'.'          ;en caso de que sea el punto, mueve a la etiqueta L23 para guardar sin sumar
    je L23
    add al,bl            ; en caso de que no sea el punto suma al con bl
    AAA 
    add al,30h
    jmp L23             ; salta a la etiqueta L23
L27:add dl, ah         ; guarda el acarreo en nuevo registro, parte baja de edx.
    dec ah              ;limpia la parte alta de eax y salta a la etiqueta L28.
    jmp L28     
L23:mov [BD_C+ecx], al    ;guarda el resultado en BD_C
    cmp ah, 1             
    je L27                ; en caso de que haya acarreo mueve a la etiqueta L27
L28:dec ecx  ; decrementa en uno ecx 
    cmp ecx,0
    jge L16 ; ciclo para sumar, salta si ecx es menor que 0.
L31:add al,dl      ; le suma a la parte baja de eax el acarreo.
    dec dl    ; limpia el registro del acarreo (parte baja de edx)
    cmp ecx,0        
    jge L54        ; salta a la etiqueta L54 si aun el ecx no es menor que cero
    
    xor eax, eax
    ret