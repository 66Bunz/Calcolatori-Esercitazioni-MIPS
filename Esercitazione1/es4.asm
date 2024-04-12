
.data
    var: .word 0x3FFFFFF0   #1073741808

.text
.globl main
.ent main

main:
    lw $t1, var
    mul $t1, $t1, 2         #2147483616

    move $a0, $t1
    li $v0, 1
	syscall

    # Non è possibile stampare il valore perché va in arithmetic overflow
    add $a0, $t1, 40
    li $v0, 1
    syscall

    # Non è possibile stampare il valore perché va in arithmetic overflow
    li $t2, 40
    add $a0, $t1, $t2
    li $v0, 1
    syscall

	li $v0, 10
	syscall
.end main