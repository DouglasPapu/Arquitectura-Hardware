        PA EQU 30h
        PB EQU 31h
        CB EQU 33h
        
	ORG	2000H	; Memoria de Datos
         ; LEDS CONECTADOS AL PUERTO PB Out()
         ; INTERRUPTORES CONECTADOS AL PUERTO PA  In(30h)
         ;  
          IN AL,(PA)
          
          MOV AL,00
          OUT (CB),AL ;O 33 00 ; 55 aa 0100101
L1:       XOR AL,AL ;AL=0
          MOV AL, 55h
          OUT (PB),AL ; APAGAR LOS LEDs
          
          MOV AL,0AAh
          OUT (PB), AL ; ENCENDER LOS LEDs
          JMP L1
	  END


	
