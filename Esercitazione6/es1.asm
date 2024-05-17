.data

.text
.globl main
.ent main

main:
    jal stampaTriangolo
    jal stampaQuadrato

	li $v0, 10
	syscall
.end main

stampaTriangolo:
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
    bne $t0, 9, cicloRigheTriangolo
    jr $ra
.end stampaTriangolo

stampaQuadrato:
    li $t0, 0                   # numero iniziale di asterischi
    li $v0, 11                  # codice di stampa carattere
cicloRigheQuadrato:
    li $a0, '*'
    li $t1, 0                   # contatore di colonne
cicloColonneQuadrato:
    syscall
    addi $t1, $t1, 1            # incremento contatore colonne
    bne $t1, 9, cicloColonneQuadrato
    li $a0, '\n'
    syscall
    addi $t0, $t0, 1            # incremento contatore asterischi
    bne $t0, 8, cicloRigheQuadrato
    jr $ra
.end stampaQuadrato

