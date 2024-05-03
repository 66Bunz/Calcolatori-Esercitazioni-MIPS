.data
    DIM = 5
    message_in: .asciiz "Inserire numeri:\n"
    message_out: .asciiz "\nMedia: "

.text
.globl main
.ent main
main:
    and $t0, $0, $0         # registro del contatore
    and $t1, $0, $0         # registro della somma

    la $a0, message_in
    li $v0, 4
    syscall

loop:
    li $v0, 5               # leggi intero
    syscall

    add $t1, $t1, $v0       # somma i valori
    addiu $t0, $t0, 1       # incrementa il contatore

    bne $t0, DIM, loop      # se il contatore è minore di DIM, ripeti il  loop

    la $a0, message_out
    li $v0, 4
    syscall

    div $t1, $t1, DIM       # calcola la media somma/DIM
    
    move $a0, $t1
    li $v0, 1               # stampa la somma
    syscall

    li $v0, 10
    syscall
.end main