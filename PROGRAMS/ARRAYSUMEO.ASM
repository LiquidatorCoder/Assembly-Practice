.MODEL SMALL
.STACK 100H
.DATA
MYARRAY DW 1234H,1125H,1227H,1223H,1124H,1221H,1226H,122BH,1228H,1229H
;DEFINE WORD
.CODE
MOV AX, @DATA
MOV DS, AX
MOV CX, 0AH
MOV BX, OFFSET MYARRAY
MOV DI, 0
MOV DH, 00H
MOV DL, 00H
HERE: MOV AX, [BX+DI]
TEST AX, 0001H
JNZ ODD
INC DL
JMP L1
ODD: INC DH
L1: INC DI
INC DI
LOOP HERE
MOV AX,DX
CALL DISPLAY
MOV AH, 4CH
INT 21H
DISPLAY PROC NEAR ; PROC IS KEYWORD FOR PROCEDURE
MOV CH, 04H
MOV CL, 04H
DISP1:
ROL AX, CL ; ROTATE LEFT 4 TIMES
PUSH AX ; SAVING ON STACK
AND AL, 0FH
ADD AL, 30H ; 48 IN DECIMAL
CMP AL, '9' ; COMPARE WITH ASCII VALUE OF 9
JBE DISP2
ADD AL, 7
DISP2: MOV DL, AL
MOV AH, 02H
INT 21H
POP AX
DEC CH
JNZ DISP1
RET
DISPLAY ENDP
END

