addi $t4,$zero,12
addi $t5,$zero,16
jalr $t5,$t7
branch: b end
add $t3,$t4,$t5
neg $t3,$t3
beq $t4,$t7,branch
end: nop