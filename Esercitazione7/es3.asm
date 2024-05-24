.data
    input: .asciiz "Inserisci un numero: "
    output: .asciiz "Numero di elementi: "

.text
.globl main
.ent main
.ent collatz
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
    jal collatz
    move $t0, $v0
    la $a0, output
    li $v0, 4
    syscall
    move $a0, $t0
    li $v0, 1
    syscall
    lw $ra, 0($sp)
    addiu $sp, 4
    jr $ra
.end main

collatz:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $s0, 0($sp)
    li $s0, 1
ciclo:
    beq $a0, 1, fine_collatz
    jal successivo
    move $a0, $v0
    addi $s0, $s0, 1
    j ciclo
fine_collatz:
    move $v0, $s0
    lw $s0, 0($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra
.end collatz

successivo:
    and $t0, $a0, 1
    beqz $t0, pari
    mulou $t0, $a0, 3
    addi $t0, $t0, 1
    j fine_successivo
pari:
    sra $t0, $a0, 1
fine_successivo:
    move $a0, $t0
    li $v0, 1
    syscall
    li $a0, '\n'
    li $v0, 11
    syscall

    move $v0, $t0
    jr $ra
.end successivo