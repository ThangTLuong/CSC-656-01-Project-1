# this is a comment
# Name: Thang Luong
# Course: CSC 656-01, Project #1
# Date: 2/6/2023
#
# Description: A bubble sort to sort an array of size 10 with all of the numbers in the array being randomly generated.

.data
array:	 .word	52, 26, 70, 29, 46, 16, 88, 64, 20, 44    	# this is the source data array, please fill with your own random numbers from https://www.calculator.net/random-number-generator.html
arrSize: .word	10     						# hard-coded problem size n=10
msg:	 .asciiz 	"The problem size is : "
before:	 .asciiz 	" a before sort "
after:	 .asciiz	" an after sort "
newline: .asciiz 	"\n"
space:	 .asciiz 	" "

.text
.globl main
main:						# int main (int argc, char **argv) {	# Beginning of the main function

						# print a string
	li	$v0, 4   			# opcode to print a string to the console
	la	$a0, msg
	syscall
	
						# print the value of the $t0 register
	li	$v0, 1				# opcode to print an int to the console
	lw	$a0, arrSize
	syscall
	
	
	li	$v0, 4
	la	$a0, newline
	syscall					# cout << "\n"
	la	$a0, before		
	syscall					# cout << " a before sort "
	la	$a0, newline
	syscall					# cout << "\n"
	jal	print				# print ()
	
	la 	$s2, arrSize			#					# The loop starts here; This is where everything is initialized
	lw 	$s2, ($s2)			# $s2 = arrSize = 10
	la	$s3, array
	move 	$s4, $s3

	
	li 	$s0, 0				# int i = 0
outerloop:
	bge 	$s0, $s2, exitloop		# for (i < arrSize) {			# Exits if $s0 is greater or equal to the arrSize

	li	$s1, 0				# int j = 0
innerloop:
	sub	$s5, $s2, $s0			# $s5 = arrSize - i
	sub	$s5, $s5, 1			# $s5 = $s5 - 1
	bge	$s1, $s5, exitinnerloop		# for (j < arrSize - i - 1) {		# Exit inner loop if $s1 is greater or equal to arrSize - $s0 - 1
	
	lw	$s5, ($s4)			# array[j]
	lw	$s6, 4($s4)			# array[j+1]
	ble	$s5, $s6, noswap		# if (array[j] > array[j+1])		# If array[j] is less than or equal to array[j+1], then no swap necessary, jump to noswap
	
	move	$a0, $s4			# swap (array[j], array[j+1])		# Calling the swap function, since I'm swapping values in the memory, I just pass in the array pointer
	jal	swap

noswap:
	addi	$s4, $s4, 4			#					# Increments the array pointer
	addi	$s1, $s1, 1			# j++					# Increment j
	blt	$s1, $s5, innerloop		# j < arrSize - i - 1			# Jumps back to the beginning of the innerloop if j < arrSize - i - 1
						# }
		
exitinnerloop:	
	move 	$s4, $s3
	addi 	$s0, $s0, 1			# i++					# Increment i
	blt 	$s0, $s2, outerloop		# i < arrSize				# Jumps back to the beginning of the outerloop if i < arrSize
						
exitloop:					# }					# Outerloop finished
	li	$v0, 4
	la	$a0, newline			
	syscall					# cout << "\n"
	la	$a0, after
	syscall					# cout << " an after sort "
	la	$a0, newline
	syscall					# cout << "\n"
	jal	print				# print ()
	
exit:						# }					# Exit main function
	li 	$v0, 10
	syscall	




print:						# ostream& operator<< (ostream& os, const int (&array)[ARRAYSIZE]) {	# Output function for array
	
	li 	$t0, 0				# int i = 0
	la 	$t1, array
printloop:					# for (i < arrSize)
	li 	$v0, 1				
	lw 	$a0, ($t1)			
	syscall					# cout << array[i]
	
	li 	$v0, 4
	la 	$a0, space
	syscall 				# cout << " "
	
	addi 	$t1, $t1, 4			# 					# Increments the array pointer
	addi 	$t0, $t0, 1			# i++					# Increments i
	blt	$t0, 10, printloop
	
exitprint:
	jr	$ra				#					# Jump back to caller function





swap:						# swap (int &left, int &right) {	# 
	lw 	$t0, ($a0)			#   temp = left;			#
	lw	$t1, 4($a0)
	sw	$t0, 4($a0)			#   left = right;			#
	sw	$t1, ($a0)			#   right = temp;			#
	jr 	$ra				# }					#

# EOF
