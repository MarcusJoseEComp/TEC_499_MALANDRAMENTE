.module fibonacci
.pseg
main: 
	addi $sp, $sp, -1
	sw $ra, 0($sp)
	addi $a0, $zero, 3
	jal fibo
	lw $ra, 0($sp)
	addi $sp, $sp, 4

fibo: 
	addi $sp, $sp, -3
	sw $s0, 0($sp)
	sw $s1, 1($sp)
	sw $ra, 2($sp)
	slti $t0, $a0, 2; se $a0 menor, $t0=1
	beq $t0, $zero, else; se igual
	addi $v0, $zero, 1
	jr $ra

else: 
	addi $s0, $a0, 0
	addi $a0, $a0, -1
	jal fibo
	addi $s1, $v0, 0
	addi $a0, $s0, -2
	jal fibo
	add $s1, $s1, $v0
	j EXIT

exit: 
	lw $s0, 0($sp)
	lw $s1, 1($sp)
	lw $ra, 2($sp)
	addi $sp, $sp, 3
	jr $ra
.end