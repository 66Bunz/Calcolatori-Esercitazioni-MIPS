.data
    inputn: .asciiz "Introdurre n: "
    inputk: .asciiz "Introdurre k: "
    result: .asciiz "C = "

.text
.globl main
.ent main

main:
    li $v0, 4
    la $a0, inputn
    syscall

    li $v0, 5
    syscall

    move $t0, $v0

    li $v0, 4
    la $a0, inputk
    syscall

    li $v0, 5
    syscall

    move $a0, $t0               # n
    move $a1, $v0               # k

    jal combina

    move $t0, $v0

    li $v0, 4
    la $a0, result
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

	li $v0, 10
	syscall
.end main

combina:
    subu $t1, $a0, $a1
    addu $t1, $t1, 1
    move $v0, $a0

ciclo1:
    beq $a0, $t1, fine1
    subu $a0, $a0, 1
    mul $v0, $v0, $a0
    j ciclo1

fine1:
    divu $v0, $v0, $a1

ciclo2:
    bltu $a1, 2, fine2
    sub $a1, $a1, 1
    divu $v0, $v0, $a1
    j ciclo2

fine2:
    jr $ra

.end combina

