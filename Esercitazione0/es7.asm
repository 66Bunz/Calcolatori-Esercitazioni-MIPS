DIM=5

.data
    bVet: .space 5
    bRes: .space 1
    message_in: .asciiz "Inserire caratteri:\n"
    message_out: .ascii "\nValore Minimo: "

.text
.globl main
.ent main

main:
    la $t0, bVet # puntatore a inizio del vettore
    li $t1, 0 # contatore
    la $a0, message_in # indirizzo della stringa
    li $v0, 4 # system call –stampastringa
    syscall

ciclo_inserimenti:
    li $v0, 12 # legge 1 char
    syscall # system call (risultato in $v0)

    sb $v0, ($t0)
    add $t1, $t1, 1
    add $t0, $t0, 1

    bne $t1, DIM, ciclo_inserimenti # itera 5 volte
    
    la $t0, bVet
    li $t1, 0 # contatore
    lb $t2, ($t0) # in $t2 memorizzo MIN iniziale

ciclo_minimo:
    lb $t3, ($t0)

    bgt $t3, $t2, salta # salta se NON deve aggiornare MIN

    lb $t2, ($t0) # aggiorna MIN

salta: 
    add $t1, $t1, 1
    add $t0, $t0, 1

    bne $t1, DIM, ciclo_minimo

    la $a0, message_out
    li $v0, 4
    syscall

    move $a0, $t2
    li $v0, 11 # stampa 1 char
    syscall

    li $v0, 10
    syscall

.end main
