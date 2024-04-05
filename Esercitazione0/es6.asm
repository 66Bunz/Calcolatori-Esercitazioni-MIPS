.data
    DIM=5
    wVett: .space 20
    message_in: .asciiz "Inserire numeri:\n"
    message_out: .asciiz "\nNumeri inseriti:\n"
    space: .ascii ";"

.text
.globl main
.ent main

main:
    la $t0, wVett
    li $t1, 0
    
    # Stampa il messaggio di input
    la $a0, message_in
    li $v0, 4
    syscall

ciclo_inserimenti:
    # Legge un intero
    li $v0, 5
    syscall

    # Salva l'intero nel vettore
    sw $v0, ($t0)

    # Aggiorna l'indirizzo del vettore e il contatore
    add $t0, $t0, 4
    add $t1, $t1, 1

    # Controlla se abbiamo letto 5 numeri
    bne $t1, DIM, ciclo_inserimenti

    # Stampa il messaggio di output
    li $v0, 4
    la $a0, message_out
    syscall

    # Stampa i numeri letti
    li $t1, 0
    la $t0, wVett

ciclo_stampa:
    lw $a0, ($t0)
    li $v0, 1
    syscall

    la $a0, space
    li $v0, 4
    syscall

    add $t0, $t0, 4
    add $t1, $t1, 1

    # Controlla se abbiamo stampato 5 numeri
    bne $t1, DIM, ciclo_stampa

    # Termina il programma
    li $v0, 10
    syscall

.end main