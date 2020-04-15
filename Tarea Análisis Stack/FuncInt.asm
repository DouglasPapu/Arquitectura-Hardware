.386
.model flat, stdcall
.data 
A dw 1

.code
start:
;{      
        lea     ecx,[esp+4]
        and     esp,-16
        push    DWORD PTR [ecx-4]
        push    ebp
        mov     ebp, esp
        push    ecx
        sub     esp, 4
;A=FuncInc(A);        
        mov     eax, DWORD PTR [A]
        sub     esp, 12  
        push    eax
        call    FuncInc_int
        add     esp, 16
        mov     DWORD PTR [A], eax
   ;}     
        mov     eax, 0
        mov     ecx, DWORD PTR [ebp-4]
        ;leave
        mov     esp,ebp
        pop     ebp
        
        lea     esp, [ecx-4]
        ret
        
FuncInc_int:   ;int FuncInc(int var){
        push    ebp
        mov     ebp, esp
        mov     eax, DWORD PTR [ebp+8]
        add     eax, 2      ;return var+2;
        pop     ebp
        ret        
end start