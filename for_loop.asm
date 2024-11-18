            .data
q:          .asciiz "Enter an integer: "
r:          .asciiz "! = "
nl:         .asciiz "\n"
            .text

main:

    # Query for an integer
    li $v0, 4
    la $a0, q
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    #for (int i = 0, x = 1; i <= n; i++)
    #   x *= i;

    li $t2, 1           # counter
    li $t1, 1           # result

loop:   bgt $t2, $t0, endloop

        mul $t1, $t1, $t2

        addi $t2, $t2, 1

        j		loop	


endloop:

    #display results of computation
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, r
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, nl
    syscall


    li $v0, 10
    syscall

    