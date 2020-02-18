addTwo:
    # map sub to $t0
    add $t0, $a0, $a1
    move $v0, $t0
    jr $ra

doSomething:
    # map x to s0
    # map y to s1
    # map a to s2
    # optimization: because b doesn't need to live beyond
    # a call, we do not map it to an sp reg

    # allocate space for the sp registers we will use,
    # along with ra
    addiu $sp, $sp, -16

    # save the register's values
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $ra, 12($sp)

    # initialize s0 and s1 with x and y
    move $s0, $a0 
    move $s1, $a1
   
    # call addTwo with x and y
    jal addTwo

    # move the result to s2
    #move $s2, $v0
    
    # call subTwo with y and x
    #move $a0, $s1 
    #move $a1, $s0 
    #jal subTwo

    # compute final result
    addi $v0, $v0, 10 

    # restore registeres, deallocate and return
    lw $ra, 12($sp)
    lw $s2, 8($sp)
    lw $s1, 4($sp)
    lw $s0, 0($sp)
    addiu $sp, $sp, 16
    jal $ra 
    
    main:
        li  $a0, 20
        li  $a1, 10
        jal doSomething

        move $t0, $v0   # save the values to t0

        li  $v0, 1
        move $a0, $t0 
        syscall 

        li  $v0, 10
        syscall 