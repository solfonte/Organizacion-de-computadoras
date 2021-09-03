addi $t1,$zero,4
addi $t2,$zero,4
beq $t1,$t2,jump
end: j 5
jump: j 1
addi $t5,$zero,1
addi $t5,$zero,2
addi $t6,$zero,2
beq $t5,$t6,end
