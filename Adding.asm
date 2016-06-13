.data
    number1: .word 5
    number2: .word 10
    number3: .word 8

.text
    lw, $t0, number1($zero)
    lw, $t1, number2($zero)
    lw, $t2, number3($zero)
    
    add, $t3, $t0, $t1        #T3 = $t0 + $t1
    sub, $t4, $t3, $t2 	      #
    
    li, $v0, 1		#Telling syscall what to do?
    move $a0, $t4	#$a0 is always printed out?
    
    syscall