.MODEL SMALL

.STACK 100H

.CODE

MOV     AX,     @DATA
MOV     DS,     AX

XOR     AX,     AX
MOV     AX,     0B800H
MOV     ES,     AX
XOR     AX,     AX
MOV     AX,     0000H
MOV     DI,     AX

XOR     AX,     AX

MOV     CX,     26
MOV     AL,     41H

store:
  STOSB
  ADD AL,1H  
  LOOP store

MOV AH,4CH
INT 21H

END