.386
.model flat, stdcall
option casemap : none
.data
ArrayNumbers DWORD 19, 21, 20, 18, 20
tam dword $-ArrayNumbers
ArrayNumbers2 DWORD 19, 21, 20, 18, 20,14,50,64 
tam2 byte $-ArrayNumbers2 ; $ Direccion actual de la variable tam. $-ArrayNumbers, restando la direccion actual con el arrayNumbers (20) bytes. 

sum DWORD 0
sum2 DWORD 0
i DWORD 0
.code
start:

    xor ecx,ecx
    lea ecx,tam2    
    mov ECX,DWORD PTR[tam2] ;(20)
    ; 01001001000  00010100 -->00001010 (10)--> 00000101 (5)
    shr    ecx,2 ; div 4 idiv ecx,4
    ;mov     ecx, esi; tama?o del arreglo
    mov edi, offset ArrayNumbers
    mov edx, offset  sum2 
    ; int sum2= sumArray(5,*ArrayNumbers[])
    ;ECX: tam
    ;EDI: Direcion base
    ;EDX : return suma
    call sumArray
    nop
    xor eax, eax
    ret
    
sumArray PROC
    push ebp     ;pop esp
    mov ebp, esp ;mov esp, ebp
    L3:
    mov     esi, DWORD PTR [i]
    mov     eax, DWORD PTR [edi + esi*4] ; Direccionamiento Indirecto
    add     DWORD PTR [edx], eax
    inc     DWORD PTR [i] ;
    loop    L3
   L2:
    mov edx,[sum2]
   ; push edx
   ; pop ecx
   ;leave
    mov esp, ebp
    pop ebp
    ret
sumArray ENDP
    
    end start
