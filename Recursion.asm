.data
    promptMessage: .asciiz "Enter a number to find it's factorial: "
    resultMessage: .ascii "\nThe factorial of the number is "
    theNumber: .word 0
    theAnswer: .word 0
    
.text
	.globl main
	main:
		
		#Display the PrompMessage
		li $v0, 4
		la $a0, promptMessage
		syscall
		
		#Get input from user and store in $v0
		li, $v0, 5
		syscall
		
		#store the word in $v0 in theNumber global variable
		sw $v0, theNumber
		
		# Call the factorial function
		lw $a0, theNumber
		jal findFactorial
		sw $v0, theAnswer
		
		#Display the results
		li $v0, 4
		la $a0, resultMessage
		syscall
		
		li $v0, 1
		lw $a0, theAnswer
		syscall
		
		#Tell the OS system that this is the end of the program
		li $v0, 10
		syscall
		
#------------------------------------------------------------------------------------------------
# findFactorial Function
	.globl findFactorial
	findFactorial:
		subu $sp, $sp 8
		sw $ra, ($sp)
		sw $s0, 4($sp)
		
		#Base Case
		li $v0, 1
		beq $a0, $0, factorialDone
		
		move $s0, $a0
		sub $a0, $a0, 1
		jal findFactorial
		
		#The magic happens here
		mul $v0, $s0, $v0
		
		factorialDone:
			lw $ra, ($sp)
			lw $s0, 4($sp)
			addu $sp, $sp, 8
			jr $ra
		