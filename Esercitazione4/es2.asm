.data
    opa: .word 2043
    opb: .word 5
    res: .space 4
    mess: .asciiz "\nScegli l'operazione da eseguire:\n 0) Somma\n 1) Sottrazione\n 2) Moltiplicazione\n 3) Divisione intera\n 4) Uscita\n"

.text
.globl main
.ent main

main:
    lw $t0, opa
    lw $t1, opb

    li $v0, 4
    la $a0, mess
    syscall

    li $v0, 5
    syscall

    move $t2, $v0

    beq $t2, 0, somma
    beq $t2, 1, sottrazione
    beq $t2, 2, moltiplicazione
    beq $t2, 3, divisione
    beq $t2, 4, uscita

somma:
    add $t3, $t0, $t1
    j stampa

sottrazione:
    sub $t3, $t0, $t1
    j stampa

moltiplicazione:
    mul $t3, $t0, $t1
    j stampa

divisione:
    div $t0, $t1
    mflo $t3
    j stampa

stampa:
    li $v0, 1
    move $a0, $t3
    syscall
    j uscita

uscita:
	li $v0, 10
	syscall
.end main
