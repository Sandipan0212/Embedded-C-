			AREA	mydata, DATA
matrix		DCB	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"
rank		DCD	4
			ALIGN
			
			AREA mycode, CODE
			ENTRY
			EXPORT __main
			
__main	
			LDR		r0, =matrix
			LDR		r1, =rank
			LDR		r1, [r1]
			LDR		r9, =0x20003000
			
			MOV 	r2, #0						        
			MOV		r3, #0				
			MOV		r7, r1						
			MOV		r8, #1						
iloop		CMP		r2, r1
			BGE 	idone
jloop		CMP		r3, r1
			BGE 	jdone
			MOV		r5, #0
			MUL		r5, r3, r7					
			ADD		r5, r2, r5
			MUL		r5, r8, r5
			ADD		r5,	r0, r5
			LDRB	r6, [r5]					        
			STRB	r6, [r9]					   
			ADD		r9, r9, r8					
			ADD		r3, r3, #1					
			B		jloop
jdone
			ADD		r2, r2, #1	
			MOV		r3, #0					
			B		iloop
idone
		
stop		B 		stop
			END