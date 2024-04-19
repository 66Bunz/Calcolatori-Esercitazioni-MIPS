.data
    err_mess: .asciiz "Introdurre valori compresi tra 0 e 255"

.text
.globl main
.ent main

main:
    li      $v0, 5
    syscall

    li      $t1, 0xFFFFFF00
    and     $t0, $v0, $t1
    bne     $t0, 0, errore
    move    $t0, $v0

    li      $v0, 5
    syscall

    and     $t1, $v0, $t1
    bne     $t1, 0, errore
    move    $t1, $v0

    not     $t3, $t1
    and		$t3, $t0, $t3		# $t3 = $t0 & $t3
    not		$t3, $t3
    xor		$t0, $t0, $t1		# $t0 = $t0 ^ $t1
    or		$t0, $t0, $t3		# $t0 = $t0 | $t3

    li		$t1, 0x000000FF     # $t1 = 0x000000FF
    and		$t0, $t0, $t1		# $t0 = $t0 & $t1
    move 	$a0, $t0		    # $a0 = $t0
    li		$v0, 1		        # $v0 = 1
    syscall

    j		fine				# jump to fine
    
errore:
    la		$a0, err_mess 
    li		$v0, 4		        # $v0 = 4
    syscall

fine:
    li		$v0, 10		        # $v0 = 10
    syscall
.end main