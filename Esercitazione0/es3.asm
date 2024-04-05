.data
    wOperand1: .word 10
    woperand2: .word 24
    wResult: .space 4

.text
.globl main
.ent main

main:
    lw $t0, wOperand1
    lw $t1, woperand2
    add $t2, $t1, $t0
    sw $t2, wResult

    li $v0, 10
    syscall 
.end main