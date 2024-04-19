.data
	w1: .word 123
	w2: .word 456
	w3: .word 789

.text
.globl main
.ent main

main:
	lw $t0, w1
	lw $t1, w2
	lw $t2, w3




	li $v0, 10
	syscall
.end main