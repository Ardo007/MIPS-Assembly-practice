                .data

zeroString:     .asciiz "zero\n"
oneString:      .asciiz "one\n"
twoString:      .asciiz "two\n"
defaultString:  .asciiz "default\n"
prompt:         .asciiz "enter a number: "

                .text


main: 

    li $t0, 0
    li $t1, 0


    #case (i) {
    #   0:          print "zero"
    #   1:          print "one"
    #   2:          print "two"
    #   default:    print "default"
    # }


    #swtich case statement

    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5           # get input from user
    syscall
    move $t0, $v0




    beq $t0, $zero, zero            # switch case
    li $t9, 1
    beq $t0, $t9, one
    li $t9, 2
    beq $t0, $t9, two
    j		default				


zero: 
    li $v0, 4
    la $a0, zeroString
    syscall
    j		end_case				
    

one:
    li $v0, 4
    la $a0, oneString
    syscall
    j		end_case	

two:
    li $v0, 4
    la $a0, twoString
    syscall
    j		end_case	

default: 
    li $v0, 4
    la $a0, defaultString
    syscall
    j		end_case	

end_case:

    li $v0, 10
    syscall


