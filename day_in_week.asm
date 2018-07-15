
.text
	.macro read_int(%n)
	li $v0,5
	syscall
	add %n,$v0,$0
	.end_macro
	
	.macro write_int(%n)
	li $v0,1
	add $a0,$0,%n
	syscall
	.end_macro
	
	.macro write_string(%string)
	.data
		Str: .asciiz %string
	.text
		li $v0,4
		la $a0,Str
		syscall
	.end_macro
	
	.macro exit
	li $v0,10
	syscall
	.end_macro
	
	#$t1 = -1
	addi $t1,$0,-1
	
	j Main
	exit
	
	Main:
		WHILE:
		write_string("What day is it today(in number, type -1 for exit): ")
		read_int($s0)
	
		#if
		beq $s0,$t1,DONE_WHILE_MAIN
			
			#$s0 = day
			#switch
			CASE_1: addi $t0,$0,1
				bne $s0,$t0,CASE_2
				write_string("Today is Sunday\n")
				j DONE_SWITCH_MAIN
			CASE_2: addi $t0,$0,2
				bne $s0,$t0,CASE_3
				write_string("Today in Monday\n")
				j DONE_SWITCH_MAIN
			CASE_3: addi $t0,$0,3
				bne $s0,$t0,CASE_4
				write_string("Today is Tuesday\n")
				j DONE_SWITCH_MAIN
			CASE_4: addi $t0,$0,4
				bne $s0,$t0,CASE_5
				write_string("Today is Wednesday\n")
				j DONE_SWITCH_MAIN
			CASE_5: addi $t0,$0,5
				bne $s0,$t0,CASE_6
				write_string("Today is Thursday\n")
				j DONE_SWITCH_MAIN
			CASE_6: addi $t0,$0,6
				bne $s0,$t0,CASE_7
				write_string("Today is Friday\n")
				j DONE_SWITCH_MAIN
			CASE_7: addi $t0,$0,7
				bne $s0,$t0,DEFAULT
				write_string("Today is Saturday\n")
				j DONE_SWITCH_MAIN
			DEFAULT:
				write_string("Invalid Day\n")
			DONE_SWITCH_MAIN:...
		
		#do while
		bne $s0,$t1,WHILE
	DONE_WHILE_MAIN: ...
