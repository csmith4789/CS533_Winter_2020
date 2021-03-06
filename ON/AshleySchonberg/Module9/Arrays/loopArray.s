        .data
arr:    .word 3, 2, 1, 8, 6
        .text

main:
    la		$t1, arr
    li		$t0, 0          # loop iterator

loop1:
    bge		$t0, 5, exit    # 5 is the sizes of the array

    # load word from address and go to next address
    lw		$t2, 0($t1)
    addi	$t1, $t1, 4

    # syscall to print value
    li      $v0, 1
    move 	$a0, $t2
    syscall

    # optional -- syscall number for printing character (space)
    li      $v0, 11
    li      $a0, 32
    syscall

    # inc counter
    addi    $t0, $t0, 1
    j		loop1				# jump to loop1
    
exit:
    li      $v0, 10
    syscall
    