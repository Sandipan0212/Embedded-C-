		AREA mydata, DATA, READONLY
source	DCD 0xF0008000, 0x72000F67, 0x0088A000, 0x00000004, 0x80000005, 0x000000B6, 0xEC456702, 0xFFF00082, 0x00D000B9, 0x00001001
		ALIGN
			
		AREA mycode, CODE, READONLY
		EXPORT __main
		ENTRY

__main	
		LDR r0, =source
		MOV r1, #0				
		MOV r7, #0				
loop	LDR	r3, [r0]			
		MOV	r10, r3
		MOV	r4, #0				
		MOV r5, #0				
loop1	TST	r3, #1
		BEQ	br
		ADD	r4, #1
		B 	br
br		LSR	r3, #1
		ADD r5, #1
		CMP	r5, #32
		BLS	loop1
			
		CMP	r7, r4
		BGT	br2
		LDR	r2, [r0]
		MOV	r7, r4
		B	br2
br2	ADD	r0, #4
		ADD	r1, #1
		CMP	r1, #10
		BGT	stop
		B	loop
		
stop	B 	stop
		END