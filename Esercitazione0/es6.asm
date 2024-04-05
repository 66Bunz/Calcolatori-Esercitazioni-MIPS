.data
    DIM=4
    wRes: .space 20
    message_in: .asciiz "Inserire numeri:\n"
    message_out: .asciiz "Numeri inseriti:\n"
    space: .ascii ";"

.text
.globl main
.ent main

main:
    # TODO: da completare
    la $t0, wVett
    li $t1, 0


    li $v0, 4, 
    la $a0, message_in
    syscall



    #  Lettura intero
    li $v0, 5
    syscall
    sw $v0, ($t0)




    li $v0, 10
    syscall

.end main