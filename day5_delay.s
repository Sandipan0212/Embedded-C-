               AREA DELAY, CODE
ENTRY
				EXPORT __main
__main
            MOV r1,#10
	    MOV r2,#100
            SDIV r3,R2,r1
	    MOV r4,#0
LOOP        SUBS r3,r3,r4
            CMP r3,#0
	    BEQ STOP
	    LDR r0,=0x100000
loop        SUBS r0,r0,#3
            CMP r0,#0
	    BNE loop
	    ADD r4,r4,#1
	    B LOOP
STOP        B STOP
            END