.386
.model flat, stdcall
option casemap : none
.data
IPHeader byte 45h, 00h,00h, 29h, 36h, 27h, 40h, 00h, 80h, 06h, 0d9h, 70h, 0c0h, 0a8h, 01h, 02h, 0dh, 58h, 1ch, 35h
IPHeader2 byte 45h, 00h, 00h, 34h, 48h, 64h, 40h, 00h, 0fch, 06h, 4bh, 28h, 0dh, 58h, 1ch, 35h, 0c0h, 0a8h, 01h, 02h
IPHeader3 byte 45h, 00h, 00h, 28h, 17h, 0dah, 40h, 00h, 80h, 06h, 5eh, 55h, 0c0h, 0a8h, 01h, 02h, 34h, 72h, 8eh, 84h
;Comprobar tambi?n con Header #2 y Header #3
;4500+0029+3627+4000+8006+d970+c0a8+0102+0d58+1c35 
.code
start:
    xor edx, edx
    xor eax,eax
    mov dh, byte ptr[IPHeader3] 
    mov dl,dh 
    and dl, 0Fh  ; Para obtener medio byte en parte baja de edx.
    and dh, 0F0h  ; Para obtener el otro medio byte en parte alta de edx.
    shr dh, 4     ; Desplazo hacia la derecha 4 bits el operando dh.
    mov al, dl
    mul dh
    mov edx, eax
    xor eax,eax
    mov esi,0 ;para procesamiento indirecto
    xor bx,bx
L11:mov   ax,word ptr[IPHeader3+esi]; AX : AH AL
    xchg  al,ah 
    add esi,2
    add bx,ax 
    jnc L12
    inc bx
L12:cmp esi,edx
    jne L11
    not bx
    xor eax, eax
    ret
    end start  ; Elaborado por: Douglas Lopez - A00347533