.data
    msgInput: .asciiz "Inserisci i valori di A, B e C"
    msgDueSoluzioni: .asciiz "Due soluzioni reali"
    msgUnaSoluzione: .asciiz "Una soluzione reale"
    msgNessunaSoluzione: .asciiz "Nessuna soluzione reale"

.text
.globl main
.ent main

main:
    la $a0, msgInput
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $t0, $v0
    li $v0, 5
    syscall
    move $t1, $v0
    li $v0, 5
    syscall
    move $t2, $v0

    mul $t3, $t1, $t1
    mul $t4, $t0, $t2
    sll $t4, $t4, 2
    sub $t3, $t3, $t4

    beq $t3, 0, una_sol

    slt $t3, $t3, 0

    bne $t3, 0, no_sol

due_sol:
    la $a0, due_sol
    j print

una_sol:
    la $a0, msgUnaSoluzione
    j print

no_sol:
    la $a0, msgNessunaSoluzione
    j print

print:
    li $v0, 4
    syscall

	li $v0, 10
	syscall
.end main
