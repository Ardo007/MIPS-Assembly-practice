            .data
prompt:     .asciiz "enter any number: "
reply:      .asciiz "you have entered: "
            .text

main: 
        li $v0, 4
        la $a0, prompt
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        li $v0, 4
        la $a0, reply
        syscall

        li $v0, 1 
        move $a0, $t0
        syscall

        li $v0, 10
        syscall 

        
