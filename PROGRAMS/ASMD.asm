; PROGRAM TO ADD, SUB, MULTIPLY & DIVIDE OPERANDS IN AX AND BX REGISTER
.MODEL SMALL
.STACK 100H

.DATA
MSG1   DB 	"THE SUM OF VALUE IN AX AND BX REGISTER IS = $"
MSG2   DB 	"THE DIFFERENCE OF VALUE IN AX AND BX REGISTER IS = $"
MSG3   DB 	"THE PRODUCT OF VALUE IN AX AND BX REGISTER IS = $"
MSG4   DB 	"THE QUOTIENT OF VALUE IN AX AND BX REGISTER IS = $"

.CODE

MOV     AX,     @DATA
MOV     DS,     AX

XOR     AX,     AX ;CLEARING
XOR     DX,     DX ;CLEARING
XOR     BX,     BX ;CLEARING

MOV     AX,     0010H
MOV     BX,     0010H
ADD     AX,     BX
PUSH    AX

MOV     DX,     OFFSET MSG1
MOV     AH,     09H
INT     21H ; INT STANDS FOR INTERRUPT INSTRUCTION 21H IS INTERRUPT NO. FOR DOS SERVICES

POP	 AX
	
CALL 	DISPLAY
XOR     AX,     AX ;CLEARING
XOR     DX,     DX ;CLEARING
XOR     BX,     BX ;CLEARING

MOV     AX,     0010H
MOV     BX,     0010H
SUB     AX,     BX
PUSH    AX

MOV     DX,     OFFSET MSG2
MOV     AH,     09H
INT     21H ; INT STANDS FOR INTERRUPT INSTRUCTION 21H IS INTERRUPT NO. FOR DOS SERVICES

POP	 AX
	
CALL 	DISPLAY
XOR     AX,     AX ;CLEARING
XOR     DX,     DX ;CLEARING
XOR     BX,     BX ;CLEARING

MOV     AX,     0010H
MOV     BX,     0010H
MUL     BX
PUSH    AX

MOV     DX,     OFFSET MSG3
MOV     AH,     09H
INT     21H ; INT STANDS FOR INTERRUPT INSTRUCTION 21H IS INTERRUPT NO. FOR DOS SERVICES

POP	 AX
	
CALL 	DISPLAY
XOR     AX,     AX ;CLEARING
XOR     DX,     DX ;CLEARING
XOR     BX,     BX ;CLEARING

MOV     AX,     0010H
MOV     BX,     0010H
DIV     BX
PUSH    AX

MOV     DX,     OFFSET MSG4
MOV     AH,     09H
INT     21H ; INT STANDS FOR INTERRUPT INSTRUCTION 21H IS INTERRUPT NO. FOR DOS SERVICES

POP	 AX
	
CALL 	DISPLAY

MOV 	AH,	4CH
INT 	21H

DISPLAY PROC NEAR ; PROC IS KEYWORD FOR PROCEDURE
MOV 	CH,	04H
MOV 	CL,	04H
DISP1:
ROL 	AX,	CL ; ROTATE LEFT  4 TIMES
PUSH 	AX ; SAVING ON STACK
AND 	AL,	0FH
ADD 	AL,	30H ; 48 IN DECIMAL
CMP 	AL,	'9' ; COMPARE WITH ASCII VALUE OF 9
JBE 	DISP2
ADD 	AL,	7
DISP2:	MOV 	DL,	AL
MOV 	AH,	02H
INT 	21H
POP 	AX
DEC 	CH
JNZ 	DISP1
MOV dl, 10
MOV ah, 02h
INT 21h
MOV dl, 13
MOV ah, 02h
INT 21h
RET
DISPLAY 	ENDP
END