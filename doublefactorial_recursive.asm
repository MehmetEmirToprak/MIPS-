.data


.text
	
	.globl main
	
	main:
	li $t0, 9
	li $t1, 2
	add $a0, $t0, $0
	
	jal double
	
	add $a0, $v0, $0
	
	j finish
	
	double:
	slt $t2, $a0, $t1
	beq $t2, $0 , else
	
	addi $v0, $0, 1
	
	jr $ra
	
	else:
	addi $sp, $sp, -8
	sw   $ra, 0($sp)
	sw   $a0, 4($sp)
	
	addi $a0, $a0, -2
	
	
	jal double
	
	lw $a0, 4($sp)        
	lw $ra, 0($sp)	
	addi $sp, $sp, 8
	mul $v0, $a0, $v0
	
	jr $ra
	
	finish:
	add $a0,$v0,$0 
	addi $v0,$0,1 
	syscall	