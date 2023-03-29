.data
	
.text

	.globl main
	main:
	li $t0, 9
	li $t1, 2
	add $a0, $t0, $0
	
	jal doublefac
	add $t5, $v0, $0
	j finish
	doublefac:
	addi $s0, $0, 1
	slt $t2, $a0, $0
	beq $t2, $0, loop
	
	loop:
	slt $t2, $a0, $0 
	beq $t2, $0, else
	add $v0, $s0, $0
	jr $ra
	
	
	else:
	mul $s0, $s0, $a0
	addi $a0,$a0,-2
	j loop
	
	
	finish:
	add $a0,$v0,$0 
	addi $v0,$0,1 
	syscall	