main:
		li 	$t0, 0
		li 	$t1, 1

		.data
if:		.asciiz "If \n "
Else:	.asciiz "Else \n"
hello:	.asciiz "Hello again \n"
		.text

		bge	$t0, $t1, Else_statm


		li	$v0, 4
		la	$a0, if
		syscall
		j end_if

Else_statm:
		li	$v0, 4
		la	$a0, Else
		syscall
end_if:

		li $v0, 4
		la $a0, hello
		syscall

		li $v0,10
		syscall