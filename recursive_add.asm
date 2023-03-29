.data 
	sum: .word 0
	a:  .word 7
	b:  .word 15
	
.text

.globl main

	main:
	lw $t0, sum
	lw $t1, a
	lw $t2, b
	
	add $a0,$t0,$0
	add $a1,$t1,$0
	add $a2,$t2,$0
	
	jal addfunc
	
	add $t0, $v0, $0
	j finish								
		
	addfunc:
	bne $a1, $a2, else
	add $v0, $a1, $0
	jr $ra
	
	else:
	addi $sp, $sp, -8
	sw   $ra, 0($sp)
	sw   $a1, 4($sp)
	
	addi $a1, $a1, 1
	jal addfunc
	   
	lw $a1, 4($sp)        
	lw $ra, 0($sp)	
	addi $sp, $sp, 8
	add $v0, $v0, $a1

	jr $ra
	
	finish:
	addi $v0,$0,1 
	add $a0,$t0,$0 
	syscall	
	
	
