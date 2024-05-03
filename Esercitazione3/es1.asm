.data
    messageInput: .asciiz "Inserisci un numero: "
    messageError: .asciiz "\nL'input inserito non è un numero valido."
    messageCorrect: .asciiz "L'input inserito è un numero valido."
    messageEmpty: .asciiz "Non hai inserito nessun numero."

.text
.globl main
.ent main

main:
    la $a0, messageInput
    li $v0, 4
    syscall

    move $t0, $0

loop:
    li $v0, 12
    syscall

    beq $v0, '\n', endLoop      # se si preme invio senza scrivere nessun numero, si termina
    blt $v0, '0', notANumber    # se il carattere inserito ha un codice ascii < 0 non è un numero
    bgt $v0, '9', notANumber    # se il carattere inserito ha un codice ascii > 9 non è un numero
    addi $t0, $t0, 1            # incremento il contatore dei numeri inseriti
    
    j loop

endLoop:
    beq $t0, 0, noInput         # se non è stato inserito nessun numero, salto a noInput
    la $a0, messageCorrect

    j printMessage

noInput:
    la $a0, messageEmpty
    
    j printMessage

notANumber:
    la $a0, messageError
    
    j printMessage

printMessage:
    li $v0, 4
    syscall

	li $v0, 10
	syscall
.end main