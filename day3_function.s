		AREA polynomial, CODE, READONLY
		ENTRY
		EXPORT __main

__main
		MOV r5, #201
		CMP r5, #20
		BGT	C1
		MOV r6, #5
		MUL r1, r5, r5
		MUL r6, r1, r6
		B	C4
		
C1		CMP r5, #50
		BGT	C2
		MOV r6, #6
		MUL r6, r5, r6
		B	C4

C2		CMP r5, #200
		BGT C3
		MOV	r6, #50
		MOV r1, #7
		MUL r1, r1, r5
		SUB r6, r1, r6
		B	C4
	
C3		MOV r6, #9
		MUL r6, r6, r5
		B	C4

C4		MOV r0, r6	
stop	B	stop
		END
		