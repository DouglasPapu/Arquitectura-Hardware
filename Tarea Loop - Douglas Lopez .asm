.386
.model flat, stdcall
option casemap : none
.data
ArrayNumbers DWORD 19,21,20,18,20
sum DWORD 0
i DWORD 0
.code
start:


    xor eax, eax    ; clean register
    xor ebx, ebx    ; clean register
    xor ecx, ecx    ; clean register
    mov ecx,5
L3:
    mov eax, DWORD PTR [i]                    ; saves in eax value of the variable i. Multiply by 4 'cause the array store 4 bytes for each element.
    mov eax, DWORD PTR [ArrayNumbers + eax*4] ; saves in eax values of the array.
    add DWORD PTR [sum], eax                  ; add all the elements of the array.
    inc DWORD PTR [i]                         ; increases the variable i by one.
    loop L3                                   ; cycles until ecx is less than 5
    
L2:
    mov ebx, DWORD PTR [sum]                  ; saves the result in ebx register.
    xor eax, eax   
    ret
    end start
