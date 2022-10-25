#objective is to take two numbers as input, and output the larger number

#Name: Alexander Eckert
#Date: 10/17/2022
#Assignment: Read input, and implement Max() func

.data
	message: .asciiz "Enter a number: "
	greater: .asciiz " <- this number is greater"
	equal: .asciiz "The numbers are equal."
	
.text
	
main:
	#printing out the message
	li $v0, 4
	la $a0, message
	syscall

	#getting user input
	li $v0, 5
	syscall

	#move input to another register
	move $s0, $v0
    
	#printing out the second message
	li $v0, 4
	la $a0, message
	syscall

	#getting second user input
	li $v0, 5
	syscall

	#move input to register $s1
	move $s1, $v0

	#prints $s1 if greater than $s0
	bgt $s1, $s0, printS1
	
	#prints $s0 if greater than $s1
	bgt $s0, $s1, printS0
	
	#prints if numbers are equal
	beq $s0, $s1, print
	
print:
	li $v0, 4
	la $a0, equal
	syscall
	j exit

printS0:
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 4
	la $a0, greater
	syscall
	j exit

printS1:
	li $v0, 1
	move $a0, $s1
	syscall
	li $v0, 4
	la $a0, greater
	syscall
	j exit

exit:
	li $v0, 10
	syscall
