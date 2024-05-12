.data
	NUM_ELEM = 4
	DIM = 4 * NUM_ELEM
	riga: .word 12, 56, 1, -5
	colonna: .word -51, 11, 0, 4
	matrice: .space DIM * NUM_ELEM
	successo: .asciiz "Successo\n"
	errore: .asciiz "Overflow\n"

.text
.globl main
.ent main

main:
	li $t0, 0				# offset matrice
	li $t1, 0				# contatore righe

ciclo_righe:
	lw $t3, riga($t1)		# carico la riga
	li $t2, 0				# contatore colonne

ciclo_colonne:
	lw $t4, colonna($t2)	# carico la colonna
	mult $t3, $t4
	mfhi $t4

	beq $t4, $0, noOverflow
	bne $t4, 0xFFFFFFFF, overflow

noOverflow:
	mflo $t4
	sw $t4, matrice($t0)
	addi $t0, $t0, 4
	addi $t2, $t2, 4
	blt $t2, DIM, ciclo_colonne
	addi $t1, $t1, 4
	blt $t1, DIM, ciclo_righe
	la $a0, errore
	li $v0, 4
	syscall
	j fine

overflow:
	la $a0, errore
	li $v0, 4
	syscall
	j fine

fine:
	li $v0, 10
	syscall
.end main
