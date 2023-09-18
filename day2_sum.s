           AREA sum,CODE
ENTRY 
        EXPORT __main
__main
       MOV R0,#0 
	   MOV R2,#0 
BACKK  ADD R0,R0,#1 
	   ADD R2,R2,R0 
	   CMP R0,#5 
	   BNE BACKK 
GO     B GO 
	   END