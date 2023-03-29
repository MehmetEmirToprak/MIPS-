.data

	array: .word 5, -1, 4, -6, 0, 8, -3, 7
	array2: .word 0, 0, 0, 0, 0, 0, 0, 0
	size: .word 8
	
.text
.globl main
	
	main:
	la $t0, array   #array
	la $t1, array2	#array2
	lw $t2, size    #size = 8
	ori $t3, $0, 0  # i = 0
	ori $t4, $0, 0  # j = 0
	
	LOOP:
	slt $t5, $t3, $t2
	beq $t5, $0, exit
	
	lw $a0, 0($t0)
	
	jal function
	sw $a0, 0($t1)
	addi $t7, $v0, 0
	beq $t7, $0, outif
	
	
	addi $t1, $t1, 4
	addi $t4, $t4, 1
	
	outif:
	addi $t0, $t0, 4
	addi $t3, $t3, 1
	
	j LOOP
	
	function:
	addi $a0, $a0, 0
	slt $s1, $a0, $0
	bne $s1, $0, outfunction1
	addi $v0, $0, 1
	
	jr $ra
	
	outfunction1:
	addi $v0, $0, 0
	jr $ra
	
	
	exit:
	addi $t3, $0, 0
	la $t0, array2

	addi $t8, $0, 5		
	print:

	beq $t8, $0, print2
	addi $v0, $0, 1
	lw $a0, ($t0)
	syscall
	addi $t8, $t8, -1
	addi $t0, $t0, 4
	j print
	print2:
					
	 				 							 				 				 							 				 				 							 				 				 							 				
	 				 							 				 				 							 				 				 							 				 				 							 				
					
									
	 	    	   