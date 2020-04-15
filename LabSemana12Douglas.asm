%include "io.inc" ;NASM
section .data
BD_dato1 db "01000.00",0
BD_delta db "00005.10",0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    lea esi,[BD_dato1]
    push esi ;0x402000
    call length 
    add esp,4
    
    lea esi,[BD_dato1] ; dir OpeA [0x402000]
    push esi
    lea edx,[BD_delta] ; dir opeB [0x402009]
    push edx
    lea edi,[BD_dato1] ; dir Result [0x402000]
    push edi
    push ecx
    mov ecx, 15
L9: call subtract
    loop L9
    add esp, 12
    ret
     
 ;-----------------------------------------------  
 ; length  input: direcci?n base del array en la pila
 ;         output; tama?o del array en ECX 
length:
    push    ebp
    mov     ebp, esp
    mov     edi,[ebp+8]
    xor     ecx,ecx
Lini:mov al, [edi + ecx]
     cmp al,0
     je fin
     inc ecx
     jmp Lini
     
fin: sub ecx, 1
     mov esp, ebp
     pop ebp
     ret   
;------------------------------------------------

 ; input: BD_dato1 en la pila, BD_delta en la pila, tamanho (Length)del BigDecimal en la pila
 ; output: resta BD_dato1 n veces. Donde n es la cantidad de veces del loop almacenado en el registro ecx
subtract:
    push ebp
    mov ebp, esp
    xor eax, eax  ; limpio el registro ya que lo usare en la resta.
    xor ebx, ebx  ; limpio el registro ya que lo usare para la resta

    mov esi, [ebp+20]
    mov edx, [ebp+16]
    mov edi, [ebp+12]
    mov ecx, [ebp+8] 
    
L27:mov al, [esi+ecx]
    mov bl, [edx+ecx]   
    cmp al, '.'
    je L23     ; si es igual al punto
    cmp al, bl
    add al,ah    ; si hay prestamos se le suma el -1
    xor ah,ah
     
    ; Aquí se resta cada elemento del bigdecimal
    sub al, bl
    AAS
    add al, 30h ; ajusto por ser ASCII
    
L23:mov [edi+ecx], al
    dec ecx
    cmp ecx, -1
    jne L27
    
    mov esp, ebp
    pop ebp
    ret