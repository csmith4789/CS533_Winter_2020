        .data
num:    .asciiz "Please enter a number: "
msg:    .asciiz "The prime factorization of "
is:     .asciiz "is "
comma:  .asciiz ","
nl:     .asciiz "\n"
        .text

main:   
        li		$v0, 4		# $v0 = 4
        la		$a0, num		# 
        syscall 

        li		$v0, 5		# $v0 = 5
        syscall
        move 	$t0, $v0		# $t0 = $v0

        li		$v0, 4		# $v0 = 4
        la		$a0, msg		# 
        syscall
        
        li		$v0, 1		# $v0 = 1
        move    $a0, $t0    
        syscall

        li		$v0, 4		# $v0 = 4
        la		$a0, is		# 
        syscall 

        li		$t1, 2		# $t1 = 2
        
while:
        bge		$t1, $t0, end_while	# if $t1 >= $t0 then end_while
        
        div     $t0, $t1
        mfhi    $t2

        bnez    $t2, else

        li		$v0, 1		# $v0 = 4
        la      $a0, $t1
        syscall

        li		$v0, 4		# $v0 = 4
        la		$a0, comma		# 
        syscall

        mflo    $t0
        
        j		while				# jump to while
        
else:
        addi	$t1, 1    			# $t1 += 1    
        
        j		while				# jump to while


end_while:
        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 4
        la      $a0, nl
        syscall

        li      $v0, 10
        syscall
