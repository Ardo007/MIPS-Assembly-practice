        .data
hello:  .asciiz "hello "
world:  .asciiz "world\n"
if:     .asciiz "if\n"
else:   .asciiz "else\n"
if2:    .asciiz "if2\n"
else2:  .asciiz "else2\n"
lessThan: .asciiz "less than\n"
greaterThan: .asciiz "greater than\n"
        .text

main:

    li $t0, 0
    li $t1, 1

    #if ($t0 = $t1)
    #   print "hello"        #no else here
    #print "world"

    #breach not equal
    bne	    $t0, $t1, print_world	# if $t0 != $t1 then goto print_world label, if they $t0 = $t1 then execute first code then the second also
        li $v0, 4
        la $a0, hello
        syscall

print_world:    
        li $v0, 4
        la $a0, world
        syscall




    #if ($t0 != $t1)
    #   print "hello"       #no else here
    #print "world"

    #breach equal
    beq		$t0, $t1, doThis	# if $t0 == $t1 then goto doThis label, if $t0 is not = to $t1 then execute first code then the second also
        li $v0, 4
        la $a0, hello
        syscall        
doThis:
        li $v0, 4
        la $a0, world
        syscall





    # if ($t0 < $t1)
    #   print "if"
    #else
    #   print "else"

    #breach greater than	
    bgt	    $t0, $t1, else1 	# if $t0 > $t1 then goto target
        la $a0, if
        syscall

        j		end_else				# jump to end_else. we don't want the code in else label to execute either
#                                       # so we jump to this empty label to not print what is in the else label
        
else1:
    la $a0, else
    syscall


end_else:


    # if ($t0 <= $t1)
    #   print "if2"
    #else
    #   print "else2"

    #breach greater than or equal
    bge		$t0, $t1, elseSecond	# if $t0 >= $t1 then goto elseSecond
        la $a0, if2
        syscall

    j   end_else2 

elseSecond:
    la $a0, else2
    syscall

 
end_else2:

    #if ($t0 > $t1)
    #   print "greater than"
    #else
    #   print "less than"

    #breach less than
    blt		$t0, $t1, else3	    # if $t0 < $t1 then goto elseStatement
        la $a0, greaterThan
        syscall

    j		end_else3			# jump to endLine
    
else3:
    la $a0, lessThan
    syscall

end_else3:

    #breach less than or equal
    ble		$t0, $t1, else4 	# if $t0 <= $t1 then goto theElse
        la $a0, greaterThan
        syscall

    j		end_else4				# jump to afterElse
    

else4:
    la $a0, lessThan
    syscall


end_else4:




    li $v0, 10
    syscall
