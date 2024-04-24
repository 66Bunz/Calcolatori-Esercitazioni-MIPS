# Stampare a video le variabili in ordine crescente

.data
	w1: .word 456
	w2: .word 132
	w3: .word 789

.text
.globl main
.ent main

main:
	lw $t0, w1
	lw $t1, w2
	lw $t2, w3

	blt $t0, $t1, L1	# if w1 < w2, go to L1
	move $t3, $t0		# else, swap w1 and w2
	move $t0, $t1		# t3 = t0
	move $t1, $t3		# t0 = t1

L1:
	blt $t1, $t2, L2	# if w2 < w3, go to L2
	move $t3, $t1		# else, swap w2 and w3
	move $t1, $t2		# t3 = t1
	move $t2, $t3		# t1 = t2

L2:
	blt $t0, $t1, L3	# if w1 < w2, go to L3
	move $t3, $t0		# else, swap w1 and w2
	move $t0, $t1		# t3 = t0
	move $t1, $t3		# t0 = t1

L3:
	move $a0, $t0
	li $v0, 1
	syscall
	li $a0, '\n'
	li $v0, 11			# print newline character
	syscall

	move $a0, $t1
	li $v0, 1
	syscall
	li $a0, '\n'
	li $v0, 11			# print newline character
	syscall

	move $a0, $t2
	li $v0, 1
	syscall
	li $a0, '\n'
	li $v0, 11			# print newline character
	syscall

	li $v0, 10
	syscall
.end main