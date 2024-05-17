.data
    stringa: .asciiz "Parola"

.text
.globl main
.ent main

main:
    li $t0, 0

ciclo:
    lbu $a0, stringa($t0)
    
    jal convertitore

    sb $v0, stringa($t0)
    addi $t0, $t0, 1
    bne $a0, 6, ciclo               # continuo fino a che non trovo il terminatore

	li $v0, 10
	syscall
.end main

convertitore:
    addi $a0, $a0, 'A'
    li $v0, 'a'
    sub $v0, $a0, $v0
    jr $ra
.end convertitore
