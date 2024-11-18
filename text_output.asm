        .data 
one:    .asciiz "this is string one!\n"
two:    .asciiz "\tthis is another string!\n"
        .text

main:   li $v0, 4       
        la $a0, one
        syscall

        la $a0, two
        syscall 

        li $v0, 10
        syscall