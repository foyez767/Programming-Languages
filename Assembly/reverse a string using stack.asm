.MODEL SMALL
.STACK 100H

.DATA

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        ;INITIALIZE COUNTER
        XOR CX, CX
        
        ;READ A CHARACTER
        MOV AH, 1
        INT 21H
        
    WHILE_: 
        CMP AL, 0DH
        JE END_WHILE
        PUSH AX
        INC CX
        
        INT 21H
        JMP WHILE_
        
    END_WHILE:
        ;GO TO NEW LINE
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        JCXZ EXIT ; IF NO CHARACTERS READ, GO TO EXIT
        
    TOP:
        POP DX
        
        INT 21H
        LOOP TOP
        
    EXIT :
        MOV AH, 4CH
        INT 21H
        
    MAIN ENDP
    
END MAIN
        
    