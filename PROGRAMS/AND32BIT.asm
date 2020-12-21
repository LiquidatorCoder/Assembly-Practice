; PROGRAM TO DISPLAY THE AND OF 32 BIT NUMBERS ON SCREEN
.MODEL SMALL     ;assembler memory model
.STACK  100H
.DATA
MSG1    DB "THE AND IS = $"
.CODE
MOV     AX,     @DATA
MOV     DS,     AX
XOR     AX,     AX ; clear register AX
XOR     DX,     DX ; clears register DX
MOV     CX,     1111H
MOV     DX,     0101H
MOV     AX,     0001H
MOV     BX,     1001H
AND     CX,     DX
AND     AX,     BX
PUSH    CX
PUSH    AX
MOV     DX,     OFFSET MSG1
MOV     AH,     09H
INT     21H     ; INT STANDS FOR INTERRUPT INSTRUCTION 21H IS INTERRUPT NO FOR DOS SERVICES
POP     AX
CALL    DISPLAY
POP     AX
CALL    DISPLAY
MOV     AH,     4CH
INT     21H
DISPLAY PROC NEAR ; PROC IS KEYWORD FOR PROCEDURE
MOV     CH,     04H
MOV     CL,     04H
DISP1:
    ROL     AX,     CL ; ROTATE LEFT 4 TIMES
    PUSH    AX      ; SAVING ON STACK
    AND     AL,     0FH
    ADD     AL,     30H ; 48 IN DECIMAL
    CMP     AL,     '9' ; COMPARE WITH ASCII VALUE OF 9
    JBE     DISP2
    ADD     AL,     7
DISP2:
    MOV     DL,     AL
    MOV     AH,     02H
    INT     21H
    POP     AX
    DEC     CH
    JNZ     DISP1
RET
DISPLAY ENDP
END