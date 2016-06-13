.data 
    age: .word 23    #This is a word / integer
    
.text
    #Print an integer to the screen
    li, $v0, 1
    lw, $a0, age
    syscall
