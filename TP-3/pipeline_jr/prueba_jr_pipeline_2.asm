addi $t3,$zero,32
addi $t5,$zero,4
loop: subi $t5,$t5,1
bge $t5,$zero,loop
jr $t3
addi $t1,$zero,25
nop
