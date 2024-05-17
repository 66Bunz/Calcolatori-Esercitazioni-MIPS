.data
    input: .asciiz "Inserisci un numero: "

.text
.globl main
.ent main

main:
    la $a0, input
    li $v0, 4
    syscall

    li $v0, 5
    syscall

    move $s0, $v0
    move $a0, $s0

    jal stampaTriangolo

    move $a0, $s0

    jal stampaQuadrato

	li $v0, 10
	syscall
.end main

stampaTriangolo:
    add $t2, $a0, 1             # calcolo numero di righe
    li $t0, 1                   # numero iniziale di asterischi
    li $v0, 11                  # codice di stampa carattere
cicloRigheTriangolo:
    li $a0, '*'
    li $t1, 0                   # contatore di colonne
cicloColonneTriangolo:
    syscall
    addi $t1, $t1, 1            # incremento contatore colonne
    bne $t1, $t0, cicloColonneTriangolo
    li $a0, '\n'
    syscall
    addi $t0, $t0, 1            # incremento contatore asterischi
    bne $t0, $t2, cicloRigheTriangolo
    jr $ra
.end stampaTriangolo

stampaQuadrato:
    add $t2, $a0, 1             # calcolo numero di righe
    li $t0, 0                   # numero iniziale di asterischi
    li $v0, 11                  # codice di stampa carattere
cicloRigheQuadrato:
    li $a0, '*'
    li $t1, 0                   # contatore di colonne
cicloColonneQuadrato:
    syscall
    addi $t1, $t1, 1            # incremento contatore colonne
    bne $t1, $t2, cicloColonneQuadrato
    li $a0, '\n'
    syscall
    addi $t0, $t0, 1            # incremento contatore asterischi
    bne $t0, $t2, cicloRigheQuadrato
    jr $ra
.end stampaQuadrato

