; PROGRAM TO DISPLAY THE XNOR OF VALUE IN AX AND BX REGISTER ON SCREEN
.MODEL SMALL

.STACK 100H

.DATA
MSG1   DB 	"THE XNOR OF VALUE IN AX AND BX REGISTER IS = $"

.CODE

MOV     AX,     @DATA
MOV     DS,     AX

XOR     AX,     AX ;CLEARING
XOR     DX,     DX ;CLEARING
XOR     BX,     BX ;CLEARING

MOV     AX,     0001
MOV     BX,     0011
XOR     AX,     BX
NOT     AX
PUSH    AX

MOV     DX,     OFFSET MSG1
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
RET
DISPLAY 	ENDP
END