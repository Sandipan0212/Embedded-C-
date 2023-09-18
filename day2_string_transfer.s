	AREA mycode, CODE
ENTRY
     EXPORT __main
__main
		MOV R1, #3
		MOV R4, #0
		LDR R2,=0x20000000
		LDR R3,=0x20030000
LOOP    LDR R0, [R2], #4
        STR R0, [R3], #4
		ADD R4, R4, #1
		CMP R4,R1
		BLT LOOP
STOP    B STOP
        END