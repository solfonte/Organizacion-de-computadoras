addi $t5,$zero,24
addi $t8,$zero,12
addi $t4,$zero,12
jalr $t5,$t3
addi $t4,$zero,13
addi $t4,$zero,23
beq $t4,$t8,end
add $t5,$zero,$zero		#si la condicion no se da, t5 = 0 y se puede verificar con los registros de la derecha
end: nop
