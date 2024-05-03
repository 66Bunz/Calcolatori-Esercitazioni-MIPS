.data
    messageInput: .asciiz "Inserisci un numero: "
    messageError: .asciiz "\nL'input inserito non è un numero valido."
    messageCorrect: .asciiz "L'input inserito è un numero valido."
    messageEmpty: .asciiz "Non hai inserito nessun numero."
    messageOutput: .asciiz "\nHai inserito un numero troppo grande."
    ZERO = 0-'0'

.text
.globl main
.ent main

main:
    la $a0, messageInput
    li $v0, 4
    syscall

    move $t0, $0
    move $t2, $0
    li $t3, 10

loop:
    li $v0, 12
    syscall

    beq $v0, '\n', endLoop      # se si preme invio senza scrivere nessun numero, si termina
    blt $v0, '0', notANumber    # se il carattere inserito ha un codice ascii < 0 non è un numero
    bgt $v0, '9', notANumber    # se il carattere inserito ha un codice ascii > 9 non è un numero
    addi $t0, $t0, 1            # incremento il contatore dei numeri inseriti

    multu $t1, $t3
    mfhi $t1

    bne $t1, $0, overflow      # se il risultato del prodotto è diverso dal secondo numero, c'è stato un overflow

    mflo $t1
    addi $t2, $v0, ZERO
    addu $t2, $t1, $t2
    bltu $t2, $t1, overflow

    move $t1, $t2
    
    j loop

endLoop:
    beq $t0, 0, noInput         # se non è stato inserito nessun numero, salto a noInput
    la $a0, messageCorrect

    li $v0, 4
    syscall
    li $v0, 1
    move $a0, $t1
    syscall

    j endProgram

noInput:
    la $a0, messageEmpty
    
    j printMessage

notANumber:
    la $a0, messageError
    
    j printMessage

overflow:
    la $a0, messageOutput

printMessage:
    li $v0, 4
    syscall

endProgram:
	li $v0, 10
	syscall
.end main
