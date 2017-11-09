	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R0, =num1
	LDR R1, =num2
	LDR R3, =res
	MOV R10, #08
	MOV R9, #00
	LDR R4, [R0]
	LDR R5, [R1]
UP
	AND R6, R4, #0X0000000F
	AND R7, R5, #0X0000000F
	ADDS R8, R6, R7
	ADD R8, R8, R9
	MOV R9, #00
	CMP R8, #09
	BLS SKIP 
	
	ADD R8, #06
	MOV R9, #01
	AND R8, #0X0000000F
SKIP
	ADD R11, R11, R8
	ROR R4, #04
	ROR R5, #04
	ROR R11, #04
	SUB R10, #01
	TEQ R10, #00
	BNE UP 
	STR R11, [R3],#04
	STR R9, [R3]
	
STOP B STOP
num1 DCD 0X12345678
num2 DCD 0X91111119
	AREA mycode, DATA, READONLY
res DCD 0
	END