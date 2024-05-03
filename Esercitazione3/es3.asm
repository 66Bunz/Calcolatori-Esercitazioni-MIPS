.data
    giorni: .byte 10
    ore: .byte 10
    minuti: .byte 10
    risultato: .space 4

.text
.globl main
.ent main

main:
    lbu $t0, giorni         # carico il valore di giorni in $t0

    mul $t1, $t0, 24        # moltiplico giorni per 24 per ottenere le ore

    lbu $t0, ore            # carico il valore di ore in $t0

    addu $t1, $t1, $t0      # sommo le ore al risultato precedente
    
    mul $t1, $t1, 60        # moltiplico per 60 per ottenere i minuti
    
    lbu $t0, minuti         # carico il valore di minuti in $t0
    
    addu $t1, $t1, $t0      # sommo i minuti al risultato precedente
    
    sw $t1, risultato       # salvo il risultato in $t1

	li $v0, 10
	syscall
.end main
