.data
    numero: .word 3141592653

.text
.globl main
.ent main

main:
    lw $a0, numero
    li $v0, 1
    syscall

    li $t0, 0                       # contatore delle cifre del numero
    li $t1, 10

    lw $t2, numero

ciclo_salva:
    divu $t2, $t1                   # divido il numero per 10
    mfhi $t2                        # metto il resto in t2
    add $t0, $t0, 1                 # incremento il contatore
    subu $sp, $sp, 4                # aggiungo uno spazio nello stack indietreggiando lo stack pointer
    sw $t2, 0($sp)                  # salvo il resto nello stack
    mflo $t2                        # metto il quoziente in t2
    bne $t2, $zero, ciclo_salva     # cicla fino a che il resto è 0
# end ciclo_salva

    li $v0, 11                      # stampo il carattere '\n'
    li $a0, '\n'
    syscall

ciclo_stampa:
    lw $a0, 0($sp)                  # carico il resto dallo stack
    li $v0, 11
    addu $a0, $a0, '0'              # converto il numero in carattere
    syscall
    
    addu $sp, $sp, 4                # tolgo lo spazio dallo stack avanzando lo stack pointer
    sub $t0, $t0, 1                 # decremento il contatore
    bne $t0, $zero, ciclo_stampa    # cicla fino a che il contatore è 0
# end ciclo_stampa

	li $v0, 10
	syscall
.end main
