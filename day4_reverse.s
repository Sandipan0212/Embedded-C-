			AREA mydata, DATA
array		DCD 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20			
			ALIGN
				
			AREA mycode, CODE
			ENTRY
			EXPORT __main
			
__main	
			LDR			r0, =array						
			MOV			r1, #0							
			
push_	    CMP			r1, #20							
			BGE			push_1					
			LDR			r2, [r0]		
			PUSH		{r2}							
			ADD			r0, #4							
			ADD			r1, #1
			B			push_						
		
push_1	    LDR			r0, =0x20003000					
			MOV			r1, #0				
pop_	    CMP			r1, #20								
			BGE			stop
			POP			{r2}							
			STR			r2, [r0]						
			ADD			r0, #4							
			ADD			r1, #1			
			B			pop_
stop		B			stop
			END
			