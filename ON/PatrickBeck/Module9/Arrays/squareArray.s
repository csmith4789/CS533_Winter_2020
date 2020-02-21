                    .data
space:              .asciiz " "
X:                  .word 3, 2, 1, 8, 6
N:                  .word 5
                    .text 

arr_square:
                    li        $t0, 0              #t0=0 loop iterator
                    li        $t1, 0              #$t1=0 offset to access the memory location

loop:
                    bge       $t0, $a1, final     #if $t0 >= $a1 then go to final
                    lw        $a0, X($t1)         #$a0 = X(i)

                    mul       $a0, $a0, $a0 
                    li        $v0, 1              #Print integer
                    syscall

                    la        $a0, space          #load a space: " "
                    li        $v0, 4              #print string
                    syscall

                    addi      $t1, $t1, 4         #Every 4 bytes there is an integer in the array
                    addi      $t0, $t0, 1         #$t0=$t0+1
                    j         loop                #go to loop

final:
                    jr        $ra

main:
                    la        $a0, X              #$a0=load address of array X
                    lw        $a1, N              #$a1=10 --number elements
                    jal       arr_square          #call arr_square

                    li        $v0, 10             #exit program
                    syscall 