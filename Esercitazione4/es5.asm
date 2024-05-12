.data
	NUMCOL = 6
	NUMRIG = 4
	DIMRIG = 4 * NUMCOL
	wMat: .word 154, 123, 109, 86, 4, 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
.ent main

main:
	la $t0, wMat
	li $t1, 0

ciclo_righe:
	li $t2, 1
	li $t3, 0

ciclo_colonne:
	lw $t4, 0($t0)
	add $t3, $t3, $t4
	addi $t0, $t0, 4
	addi $t2, $t2, 1
	blt $t2, NUMCOL, ciclo_colonne

	sw $t3, 0($t0)
	addi $t0, $t0, 4
	addi $t1, $t1, 1

	blt $t1, NUMRIG, ciclo_righe
	li $t1, 0

ciclo_colonne2:
	la $t0, wMat
	sll $t3, $t1, 2
	add $t0, $t0, $t3
	li $t2, 1
	li $t3, 0

cicl_righe2:
	lw $t4, 0($t0)
	add $t3, $t3, $t4
	addi $t0, $t0, DIMRIG
	addi $t2, $t2, 1
	blt $t2, NUMRIG, ciclo_righe2
	sw $t3, 0($t0)
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	blt $t1, NUMCOL, ciclo_colonne2

	li $v0, 10
	syscall
.end main
