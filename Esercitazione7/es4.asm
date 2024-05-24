.data
    matrice: .word 10, 6, 7, 4
    output: .asciiz "Determinante: "

.text
.globl main
.ent main
.ent determinante

main:
    subu $sp, $sp, 4
    sw $ra, 0($sp)

    la $t0, matrice
    lw $a0, 0($t0)
    lw $a1, 4($t0)
    lw $a2, 8($t0)
    lw $a3, 12($t0)

    jal determinante

    move $t0, $v0

    la $a0, output

    li $v0, 4
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    lw $ra, 0($sp)
    addu $sp, 4
    jr $ra
.end main

determinante:
    mul $t0, $a0, $a3
    mul $t1, $a1, $a2
    sub $v0, $t0, $t1
    jr $ra
.end determinante