.data
    input: .asciiz "Inserisci un numero: "

.text
.globl main
.ent main
.ent successivo

main:
    subu $sp, 4
    sw $ra, 0($sp)
    
    la $a0, input
    li $v0, 4
    syscall

    li $v0, 5
    syscall

    move $a0, $v0
    jal successivo

    lw $ra, 0($sp)
    addiu $sp, 4
    jr $ra
.end main

successivo:
    and $t0, $a0, 1
    beqz $t0, pari
    mulou $t0, $a0, 3
    addi $t0, $t0, 1
    j fine
pari:
    sra $t0, $a0, 1
fine:
    move $a0, $t0
    li $v0, 1
    syscall
    li $a0, '\n'
    li $v0, 11
    syscall

    move $v0, $t0
    jr $ra
.end successivo
