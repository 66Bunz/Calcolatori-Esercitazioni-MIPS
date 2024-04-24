.data
	num: .half 19791979

.text
.globl main
.ent main

main:
	and $t3, $0, $0		# azzera campo risultato
	and $t4, $0, $0		# azzera indice

	lh $t0, num		# carica il numero
	li $t1, 1		# dobbiamo contare i bit a 1, quindi carichiamo 1 per il confronto

loop:
	and $t2, $t0, $t1	# confronta il bit meno significativo con 1
	beq $t2, $0, skip	# se il bit è 0, salta
	addi $t3, $t3, 1	# incrementa di uno il campo risultato

skip:
	sll $t1, $t1, 1		# shifta a sinistra il bit di confronto
	addi $t4, $t4, 1	# incrementa l'indice
	bne $t4, 16, loop	# se non abbiamo finito, ripeti


	move $a0, $t3		# carica il risultato in $a0
	li $v0, 1		# carica il codice di syscall per la stampa di un intero
	syscall

	li $v0, 10
	syscall
.end main