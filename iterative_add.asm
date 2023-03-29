.data
	sum: .word 0
	a: .word 7
	b: .word 15
.text

	.globl main
	
	main:
	lw $t0, sum
	lw $t1, a
	lw $t2, b
	
	add $a0, $t0, $0
	add $a1, $t1, $0
	add $a2, $t2, $0
	
	jal addfunc
		
	add $t0, $v0, $0
	
	j finish	
			
	addfunc:
	bgt $a1, $a2, then
	add $a0, $a0, $a1
	addi $a1, $a1, 1
	j addfunc
	
	then:
	add $v0, $a0, $0
	jr $ra
	
	
	finish:
	addi $v0,$0,1 
	add $a0,$t0,$0 
	syscall	
	
