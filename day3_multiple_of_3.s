		AREA mydata, DATA, READONLY
source	DCD	1,2,3,4,5,6,7,8,9,10
		ALIGN
			
		AREA mycode, CODE, READONLY
		EXPORT __main
		ENTRY
	
__main	
		LDR r0, =source
		MOV	r2, #0			
		MOV r8, #0			
		MOV r3, #3
loop	CMP	r2, #10
		BGE	stop
		LDR	r1, [r0]
		UDIV r4, r1, r3
		MUL	r4, r4, r3
		SUB	r5, r1, r4
		CMP r5, #0
		BEQ	b1
		B	b2
		
b1		ADD	r8, #1
		B	b2

b2		ADD	r2, #1
		ADD	r0, #4
		B	loop
		
stop	MOV	r8, r8
		END