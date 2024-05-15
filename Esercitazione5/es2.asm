.data
    input: .asciiz "Inserire una stringa: "
    outputEmpty: .asciiz "\nNon è stato inserito nessun carattere.\n"
    outputPalindrome: .asciiz "La stringa è palindroma.\n"
    outputNotPalindrome: .asciiz "La stringa non è palindroma.\n"

.text
.globl main
.ent main

main:
    move $t0, $sp
    move $s0, $sp

    li $t1, 0
    la $a0, input
    li $v0, 4
    syscall

ciclo_lettura:
    li $v0, 12                      # leggi un carattere
    syscall
    
    beq $v0, '\n', fine_lettura     # se il carattere è a-capo, termina la lettura

    addi $t1, $t1, 1                # altrimenti incrementa il contatore
    subu $sp, $sp, 4                # alloca spazio nello stack pointer
    sw $v0, 0($sp)                  # salva il carattere nello stack pointer
    b ciclo_lettura                 # ripeti il ciclo

fine_lettura:
    beq $t1, 0, no_input            # se non c'è nessun carattere, stampa errore

ciclo_controllo:
    subu $t0, $t0, 4                
    lw $t2, 0($t0)
    lw $t3, 0($sp)

    addu $sp, $sp, 4
    bne $t2, $t3, no_palindromo

    addi $t1, $t1, -2
    bgt $t1, 0, ciclo_controllo

    b si_palindromo

si_palindromo:
    la $a0, outputPalindrome
    b stampa

no_input:
    la $a0, outputEmpty
    b stampa

no_palindromo:
    la $a0, outputNotPalindrome
    b stampa

stampa:
    li $v0, 4
    syscall
    
    move $sp, $s0

	li $v0, 10
	syscall
.end main
