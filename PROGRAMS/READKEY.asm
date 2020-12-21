.MODEL SMALL
.STACK 100H
.CODE

MOV     AX,     @DATA
MOV     DS,     AX

MOV     AH,     1
INT     21H

MOV     DL,     AL
MOV     AH,     2
INT     21H

MOV     AH,     4CH
INT     21H

END