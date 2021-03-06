        .data
base:   .asciiz "Enter the base: "
expon:  .asciiz "Enter the exponent: "
msg:    .asciiz "The answer of b^e is: "
nl:     .asciiz "\n"
        .text
power:
        bne     $a2, $zero, recursion   # if the power is greater than 1, then jmp to recursion label
        li      $v0, 1                  # otherwise return 1
        jr      $ra

recursion:
        addi    $sp, $sp, -4            # Allocate space for one integer on the stack
        sw      $ra, 0($sp)             # store the return address on the stack
        addi    $a2, $a2, -1            # decrease the power by one
        jal     power                   # call the power func with the new parameter
        mul     $v0, $a1, $v0           # multiplay the result by the base and save it as the new res
        lw      $ra, 0($sp)             # store the return address from the stack
        addi    $sp, $sp, 4             # Deallocate the memory on the stack
        jr      $ra                     # return to the calling function

main:
        li      $v0, 4                  # prompt user for base number
        la      $a0, base
        syscall

        li      $v0, 5                  # get number
        syscall

        move 	$a1, $v0

        li      $v0, 4                  # prompt user for exponent number
        la      $a0, expon
        syscall

        li      $v0, 5                  # get number
        syscall

        move 	$a2, $v0
        
        jal     power                   # compute 5^3

        move    $t0, $v0

        li      $v0, 4
        la      $a0, msg
        syscall

        li      $v0, 1
        move    $a0, $t0
        syscall                         #display the result

        li      $v0, 10
        syscall