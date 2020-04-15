.386
.model flat, stdcall
option casemap : none

.data


.code
start:
; Programa a realizar.
; int ArrayNumber[5] = {19,21,20,18,20}
; int sum = 0
 ;  for(int i = 0; i<5; ++i){
 ;    sum += ArrayNumber[i];
 ;  }
    
    xor ebp, ebp
    xor eax, eax
    mov DWORD PTR [ebp-20], 19
    mov DWORD PTR [ebp-16], 21
    mov DWORD PTR [ebp-12], 20
    mov DWORD PTR [ebp-8], 18
    mov DWORD PTR [ebp-4], 20
    
    mov DWORD PTR [ebp-4], 0
    mov DWORD PTR [ebp.8], 0
    
.L3:
    cmp  DWORD PTR [ebp-8],4
    jg .L2
    mov eax, DWORD PTR [ebp-8]
    mov eax, DWORD PTR [ebp-28+eax*4] ; Direccionamiento Escalado
    add DWORD PTR [ebp-4], eax
    add DWORD PTR [ebp-8],1
    jmp .L3
.L2: 
    mov eax, 0
    leave
    ret
    end start
