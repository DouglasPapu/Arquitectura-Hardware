.386
.model flat, stdcall
option casemap : none
.code
start:

    nop
  ;   pop esi  ;direccion de retorno del main.
  ;  push 01234567h
  ;  push 89ABCDEFh
  ;  pop ecx
  ;  pop edx
  
    push 0ABCDEF60h
    push 7801EF78h 

    mov ebp, esp ; mov esp, ebp
  
   ; mov ebp, esp
    mov ecx, [ebp] ;=pop ecx
    add esp,8
  ;  mov ecx, [0019FF74h]
    xor eax, eax
    ret
    end start
