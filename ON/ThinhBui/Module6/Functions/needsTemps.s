.data
msg1: .asciiz "Your answer= "
.text
needsTemps:
add $t0, $a0, $a1
sub $t1, $a0, $a1
mult $t0, $t1
mflo $t2
move $v0, $t2
jr		$ra					# jump to $ra
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $a0, 10
    li $a1, 8
    jal needsTemps

    move $t0, $v0
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10

    syscall