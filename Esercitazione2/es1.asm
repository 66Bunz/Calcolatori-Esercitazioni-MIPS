.data
	mess_pari: .asciiz "Pari"
	mess_dispari: .asciiz "Dispari"

.text
.globl main
.ent main

main:
	li $v0, 5
	syscall

	andi $t0, $v0, 1	# se il valore inserito è pari (LSB = 0) salva 0 in $t0, se è dispari (LSB = 1) salva 1 in $t0
	la $a0, mess_pari
	beq $t0, $zero, salto	# branch se $t0 è uguale a 0, quindi se il numero inserito è pari

	la $a0, mess_dispari

salto:
	li $v0, 4
	syscall

	li $v0, 10
	syscall
.end main