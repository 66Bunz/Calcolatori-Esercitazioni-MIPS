.data
    DIM = 7
    vettore: .word 15, 870, 1200, -21, -1000, 15003, -1039581

.text
.globl main
.ent main

main:
    la $a0, vettore
    li $a1, DIM
    
    jal trova_massimo

    move $a0, $v0
    li $v0, 1
    syscall

	li $v0, 10
	syscall
.end main

trova_massimo:
    move $t0, $a0
    move $t1, $a1
    lw $v0, 0($t0)

ciclo:
    add $t0, $t0, 4
    sub $t1, $t1, 1
    beqz $t1, fine
    lw $t2, 0($t0)
    blt $t2, $v0, next
    move $v0, $t2
next:
    j ciclo
fine:
    jr $ra

.end trova_massimo
