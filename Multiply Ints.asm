.data

.text

    main:
        addi, $s0, $zero, 2000
    	addi, $s1, $zero, 10
    
    	mult $s0, $s1
    
    	mflo $s0
    
    	jal displayMessage
    	
    	#Tell the system that the program is finished
    	li $v0, 10
    	syscall
    
    #Output the result
    displayMessage:
    	li, $v0, 1
    	add, $a0, $zero, $s0
    
    	syscall
    
    	jr $ra