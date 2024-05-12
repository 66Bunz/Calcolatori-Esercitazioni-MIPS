.data
    NUM_ELEMENTI = 20
    DIM = 4 * NUM_ELEMENTI

    wVettore: .space DIM

.text
.globl main
.ent main

main:
    li $t0, 0               # contatore
    li $t1, 1               # primo valore del vettore è 1

    sw $t1, wVettore($t0)   # salvo il primo valore del vettore
    
    addi $t0, $t0, 4        # incremento il contatore
    
    li $t2, 1               # secondo valore del vettore è 1
    sw $t2, wVettore($t0)   # salvo il secondo valore del vettore

    addi $t0, $t0, 4        # incremento il contatore

    li $t3, 0               # inizializzo il terzo valore del vettore a 0


loop:
    add $t3, $t1, $t2       # sommo i due valori precedenti alla posizione da inserire
    sw $t3, wVettore($t0)   # salvo il valore nel vettore

    addi $t0, $t0, 4        # incremento il contatore
    
    move $t1, $t2           # il penultimo valore diventa il primo
    move $t2, $t3           # l'ultimo valore diventa il secondo
    
    bne $t0, DIM, loop      # ripeto se contatore < DIM

    li $t0, 0               # contatore


loop_print:

    lw $a0, wVettore($t0)
    li $v0, 1
    syscall

    li $a0, 10              # carico il carattere di a capo
    li $v0, 11              # syscall per la stampa di un carattere
    syscall
    
    addi $t0, $t0, 4        # incremento il contatore

    bne $t0, DIM, loop_print  # ripeto se contatore < DIM


	li $v0, 10
	syscall
.end main


# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765