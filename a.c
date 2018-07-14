.data

.text
	.macro new_line
	li $a0,10
	li $v0,11
	syscall
	.end_macro
	
	.macro read_int(%n)
	li $v0,5
	syscall
	add %n,$v0,$0
	.end_macro
	
	.macro print_int(%n)
	li $v0,1
	add $a0,$0,%n
	syscall
	.end_macro
	
	.macro print_str(%str)
	.data
		Str: .asciiz %str
	.text
		li $v0,4
		la $a0,Str
		syscall
	.end_macro
	
	
	addi $t0,$0,10
	bne $t0,$0, ELSE
	print_str("Vc digitou 0\n")
	j DONE
	ELSE: print_str("Vc digitou um numero diferente de 0\n")
	DONE:...
