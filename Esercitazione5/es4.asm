.data
    DIM = 5
    NEXT_COL = 4
    NEXT_ROW = 4 * DIM
    NEXT_DIAG = 4 * (DIM + 1)

    matrix: .word 1, 0, 0, 0, 0
            .word 0, 2, 0, 1, 0
            .word 0, 0, 3, 0, 0
            .word 0, 1, 0, 4, 0
            .word 0, 0, 0, 0, 5

.text
.globl main
.ent main

main:
    la $t0, matrix
    li $t1, DIM-1
    li $a0, 2

ciclo1:
    move $t2, $t1
    move $t3, $t0
    move $t4, $t0

ciclo2:
    addiu $t3, $t3, NEXT_COL
    addiu $t4, $t4, NEXT_ROW
    lw $t5, 0($t3)

    beq $t5, 0, next
    
    li $a0, 1

next:
    lw $t6, 0($t4)
    
    bne $t5, $t6, no_simm

    sub $t2, $t2, 1

    bne $t2, 0, ciclo2

    addiu $t0, $t0, NEXT_DIAG
    sub $t1, $t1, 1

    bne $t1, 0, ciclo1
    j fine

no_simm:
    li $a0, 0

fine:
    li $v0, 1
    syscall

	li $v0, 10
	syscall
.end main
