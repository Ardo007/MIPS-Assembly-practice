                    .data
nl:                 .asciiz "\n"
prompt:             .asciiz "enter a number: "
prompt2:            .asciiz "enter another number: "
addition:           .asciiz "the addition is: "
subtraction:        .asciiz "the subtraction is: "
multiplication:     .asciiz "the multiplication is: "
division:           .asciiz "the division is: "
remainder:          .asciiz "the remainder is: "
                    .text



main: 

    li $t2, 8
    li $t3, 2

    li $v0, 4
    la $a0, prompt          # print prompt
    syscall

    li $v0, 5               # get int input from user
    syscall
    move $t0, $v0           # move the number we get from v0 to t0

    li $v0, 4               # print nl
    la $a0, nl
    syscall

    li $v0, 4
    la $a0, prompt2         # print prompt2
    syscall

    li $v0, 5               # get the second number from the user and put it in register t1
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 4
    la $a0, addition
    syscall

    add $a0, $t0, $t1                      # add what is in t0 and t1 and put it in a0
    li $v0, 1                              # print the result of the addition
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 4
    la $a0, subtraction
    syscall

    sub $a0, $t0, $t1                     # do what is in t0 minus what is in t1 and put it in a0
    li $v0, 1                             # print out the result of subtraction 
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 4
    la $a0, multiplication
    syscall

    mult $t0, $t1                        # multiply content in t0 with t1
    mflo $a0                             # the result will be split into 32 bit in hi register and 32 bits in lo registers cuz the mult gives out a 64 bit int
    li $v0, 1                            # since it is not a big number then our result will be in the lo registers while nothing will be in the hi registers (0)
    syscall

    # mul $a0, $t0, $t1                 # we can use this alternatively to mult and it basically put the mult and mflo into one
    # li $v0, 1
    # syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 4
    la $a0, division
    syscall

    div $t0, $t1                        # same case as mult. hi registers is for remainder. lo registers is for quotient 
    mflo $a0
    li $v0, 1
    syscall

    # div $a0, $t0, $t1                 # same case as mul. only does the quotient
    # li $v0, 1
    # syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 4
    la $a0, remainder
    syscall

    mfhi $a0                        # print the remainder
    li $v0, 1
    syscall

    # rem $a0, $t0, $t1             # we can use this to get the remainder instead
    # li $v0, 1
    # syscall

    li $v0, 4
    la $a0, nl
    syscall


    li $v0, 10
    syscall
