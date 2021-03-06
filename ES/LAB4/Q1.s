;Convert a 32-bit hexadecimal number into unpacked form.
	AREA RESET,DATA,READONLY
	EXPORT __Vectors
	
__Vectors
    DCD 0x10001000
	DCD Reset_Handler
	
	AREA MYCODE,CODE,READONLY
	ENTRY 
	EXPORT Reset_Handler

Reset_Handler
    LDR R0, =NUM 
	LDR R0,[R0] ;LOADS THE NUMBER TO R0
	LDR R5, =RESULT ;RESULT IS STORED IN THE MEMOMRY SINCE EACH DIGIT WILL NEED 2-DIGITS TO STORE.
	
	LDR R1,=0; COUNTER, WILL BE USED FOR SHIFTING OF THE NUMBER FOR DIGIT EXTRACTION.
	LDR R2,=8; COUNTER FOR EACH OF THE DIGITS IN THE NUMBER.

UP LSR R6,R0,R1 
   AND R6, #0X0F
   ADD R1, #04
   CMP R6, #09
   BLO DOWN
   ADD R6,#07
DOWN ADD R6,#0X30
   STRB R6,[R5],#01
   SUB R2,#01
   TEQ R2,#0
   BNE UP
STOP B STOP
	AREA MYDATA,DATA,READWRITE
NUM DCD 0X123
RESULT DCD 0,0
	END