	AREA	RESET,DATA,READONLY
	EXPORT	__Vectors
__Vectors
	DCD	0X10001000
	DCD	Reset_Handler
	AREA	mycode,CODE,READONLY
	ENTRY
	EXPORT	Reset_Handler
Reset_Handler
	LDR R1,=0XF0000000
	LDR R2,=0XE0000000
	LDR R3,=0XD0000000
	LDR R4,=0XC0000000
	LDR R5,=0XB0000000
	LDR R6,=0XA0000000
	LDR R7,=0X90000000
	LDR R8,=0X80000000
	LDR R9,=0X70000000
	LDR R10,=0X60000000
	STM R13!,{R1,R2,R3,R4,R5,R6,R7,R8,R9,R10}
	MOV R0,R13
	MOV R3,#10
UP1
	MOV R13,R0
	MOV R11,R3
	LDR R12,=0XFFFFFFFF
UP
	LDMDB R13!,{R1}
	CMP R1,R12
	BHS DWN
	MOV R2,R13
	MOV R12,R1
DWN
	SUB R11,#1
	TEQ R11,#0
	BNE UP
	STM R13!,{R12}
	MOV R13,R2
	STM R13,{R1}
	SUB R3,#1
	TEQ R3,#0
	BNE UP1
	MOV R13,R0
	LDMDB R13!,{R1,R2,R3,R4,R5,R6,R7,R8,R9,R10}
STOP B STOP
	END
	