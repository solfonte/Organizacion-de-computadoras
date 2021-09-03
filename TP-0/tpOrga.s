	.file	1 "tpOrga.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"$ tp0 -h\000"
	.align	2
$LC1:
	.ascii	"Usage:tp0 -h\012tp0 -V\012tp0 [options]\012Options:\000"
	.align	2
$LC2:
	.ascii	"-V, --version\011Print version and quit.\000"
	.align	2
$LC3:
	.ascii	"-h, --help\011Print this information.\000"
	.align	2
$LC4:
	.ascii	"-o, --output\011Path to output file.\000"
	.align	2
$LC5:
	.ascii	"-i, --input\011Path to input file.\000"
	.align	2
$LC6:
	.ascii	"-d, --decode\011Decode a base64-encoded file.\000"
	.text
	.align	2
	.globl	mostrar_ayudas
	.set	nomips16
	.set	nomicromips
	.ent	mostrar_ayudas
	.type	mostrar_ayudas, @function
mostrar_ayudas:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	lw	$2,%got($LC0)($28)
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC1)($28)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC2)($28)
	addiu	$4,$2,%lo($LC2)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC3)($28)
	addiu	$4,$2,%lo($LC3)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC4)($28)
	addiu	$4,$2,%lo($LC4)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC5)($28)
	addiu	$4,$2,%lo($LC5)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC6)($28)
	addiu	$4,$2,%lo($LC6)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	mostrar_ayudas
	.size	mostrar_ayudas, .-mostrar_ayudas
	.align	2
	.globl	verifico_signo_igual
	.set	nomips16
	.set	nomicromips
	.ent	verifico_signo_igual
	.type	verifico_signo_igual, @function
verifico_signo_igual:
	.frame	$fp,24,$31		# vars= 8, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$fp,20($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	sw	$5,28($fp)
	sw	$6,32($fp)
	sb	$0,8($fp)
	sw	$0,12($fp)
	b	$L3
	nop

$L5:
	lw	$2,12($fp)
	lw	$3,24($fp)
	addu	$2,$3,$2
	lb	$3,0($2)
	li	$2,61			# 0x3d
	bne	$3,$2,$L4
	nop

	lw	$2,32($fp)
	lw	$2,0($2)
	addiu	$3,$2,1
	lw	$2,32($fp)
	sw	$3,0($2)
	li	$2,1			# 0x1
	sb	$2,8($fp)
$L4:
	lw	$2,12($fp)
	addiu	$2,$2,1
	sw	$2,12($fp)
$L3:
	lw	$3,12($fp)
	lw	$2,28($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L5
	nop

	lbu	$2,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	verifico_signo_igual
	.size	verifico_signo_igual, .-verifico_signo_igual
	.align	2
	.globl	contar_leido
	.set	nomips16
	.set	nomicromips
	.ent	contar_leido
	.type	contar_leido, @function
contar_leido:
	.frame	$fp,24,$31		# vars= 8, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$fp,20($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	sw	$0,8($fp)
	b	$L8
	nop

$L9:
	lw	$2,8($fp)
	addiu	$2,$2,1
	sw	$2,8($fp)
$L8:
	lw	$2,8($fp)
	lw	$3,24($fp)
	addu	$2,$3,$2
	lb	$2,0($2)
	bne	$2,$0,$L9
	nop

	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	contar_leido
	.size	contar_leido, .-contar_leido
	.rdata
	.align	2
$LC7:
	.ascii	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123"
	.ascii	"456789+/\000"
	.text
	.align	2
	.globl	letra_en_tabla
	.set	nomips16
	.set	nomicromips
	.ent	letra_en_tabla
	.type	letra_en_tabla, @function
letra_en_tabla:
	.frame	$fp,32,$31		# vars= 16, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	move	$fp,$sp
	.cprestore	0
	move	$2,$4
	sb	$2,32($fp)
	sb	$0,8($fp)
	sw	$0,12($fp)
	sw	$0,16($fp)
	b	$L12
	nop

$L15:
	lw	$2,%got($LC7)($28)
	addiu	$3,$2,%lo($LC7)
	lw	$2,12($fp)
	addu	$2,$3,$2
	lb	$2,0($2)
	lb	$3,32($fp)
	bne	$3,$2,$L13
	nop

	li	$2,1			# 0x1
	sb	$2,8($fp)
	lw	$2,12($fp)
	sw	$2,16($fp)
$L13:
	lw	$2,12($fp)
	addiu	$2,$2,1
	sw	$2,12($fp)
$L12:
	lbu	$2,8($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L14
	nop

	lw	$2,12($fp)
	slt	$2,$2,64
	bne	$2,$0,$L15
	nop

$L14:
	lbu	$2,8($fp)
	beq	$2,$0,$L16
	nop

	lw	$2,16($fp)
	b	$L18
	nop

$L16:
	li	$2,-1			# 0xffffffffffffffff
$L18:
	move	$sp,$fp
	lw	$fp,28($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	letra_en_tabla
	.size	letra_en_tabla, .-letra_en_tabla
	.align	2
	.globl	pasar_a_binario
	.set	nomips16
	.set	nomicromips
	.ent	pasar_a_binario
	.type	pasar_a_binario, @function
pasar_a_binario:
	.frame	$fp,32,$31		# vars= 16, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	sw	$6,40($fp)
	sw	$7,44($fp)
	sw	$0,8($fp)
	lw	$3,36($fp)
	lw	$2,44($fp)
	addu	$2,$3,$2
	addiu	$2,$2,-1
	sw	$2,12($fp)
$L21:
	lw	$3,40($fp)
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0x1
	and	$2,$3,$2
	bgez	$2,$L20
	nop

	addiu	$2,$2,-1
	li	$3,-2			# 0xfffffffffffffffe
	or	$2,$2,$3
	addiu	$2,$2,1
$L20:
	sw	$2,16($fp)
	lw	$2,40($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	sw	$2,40($fp)
	lw	$3,12($fp)
	lw	$2,8($fp)
	subu	$2,$3,$2
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$3,16($fp)
	sw	$3,0($2)
	lw	$2,8($fp)
	addiu	$2,$2,1
	sw	$2,8($fp)
	lw	$3,8($fp)
	lw	$2,44($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L21
	nop

	nop
	move	$sp,$fp
	lw	$fp,28($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	pasar_a_binario
	.size	pasar_a_binario, .-pasar_a_binario
	.align	2
	.globl	separador_de_a_ocho
	.set	nomips16
	.set	nomicromips
	.ent	separador_de_a_ocho
	.type	separador_de_a_ocho, @function
separador_de_a_ocho:
	.frame	$fp,72,$31		# vars= 32, regs= 2/2, args= 16, gp= 8
	.mask	0xc0000000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,60($sp)
	sw	$fp,56($sp)
	sdc1	$f20,64($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,72($fp)
	sw	$5,76($fp)
	sw	$6,80($fp)
	sw	$0,24($fp)
	sw	$0,28($fp)
	li	$3,3			# 0x3
	lw	$2,80($fp)
	subu	$2,$3,$2
	sw	$2,44($fp)
	b	$L23
	nop

$L26:
	sw	$0,32($fp)
	li	$2,7			# 0x7
	sw	$2,36($fp)
	sw	$0,40($fp)
	b	$L24
	nop

$L25:
	lw	$3,28($fp)
	lw	$2,40($fp)
	addu	$2,$3,$2
	sll	$2,$2,2
	lw	$3,72($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	mtc1	$2,$f0
	cvt.d.w	$f20,$f0
	lw	$2,36($fp)
	mtc1	$2,$f0
	cvt.d.w	$f2,$f0
	lw	$2,%got($LC8)($28)
	ldc1	$f0,%lo($LC8)($2)
	mov.d	$f14,$f2
	mov.d	$f12,$f0
	lw	$2,%call16(pow)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,pow
1:	jalr	$25
	nop

	lw	$28,16($fp)
	mul.d	$f0,$f20,$f0
	lw	$2,32($fp)
	mtc1	$2,$f2
	cvt.d.w	$f2,$f2
	add.d	$f0,$f2,$f0
	trunc.w.d $f0,$f0
	mfc1	$2,$f0
	sw	$2,32($fp)
	lw	$2,36($fp)
	addiu	$2,$2,-1
	sw	$2,36($fp)
	lw	$2,40($fp)
	addiu	$2,$2,1
	sw	$2,40($fp)
$L24:
	lw	$2,40($fp)
	slt	$2,$2,8
	bne	$2,$0,$L25
	nop

	lw	$2,28($fp)
	addiu	$2,$2,8
	sw	$2,28($fp)
	lw	$2,32($fp)
	sb	$2,48($fp)
	lw	$2,24($fp)
	lw	$3,76($fp)
	addu	$2,$3,$2
	lbu	$3,48($fp)
	sb	$3,0($2)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L23:
	lw	$3,24($fp)
	lw	$2,44($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L26
	nop

	nop
	move	$sp,$fp
	lw	$31,60($sp)
	lw	$fp,56($sp)
	ldc1	$f20,64($sp)
	addiu	$sp,$sp,72
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	separador_de_a_ocho
	.size	separador_de_a_ocho, .-separador_de_a_ocho
	.align	2
	.globl	decodificar_base_64
	.set	nomips16
	.set	nomicromips
	.ent	decodificar_base_64
	.type	decodificar_base_64, @function
decodificar_base_64:
	.frame	$fp,152,$31		# vars= 120, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-152
	sw	$31,148($sp)
	sw	$fp,144($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,152($fp)
	sw	$5,156($fp)
	sw	$6,160($fp)
	sw	$7,164($fp)
	sw	$0,24($fp)
	sw	$0,28($fp)
	sw	$0,136($fp)
	sb	$0,32($fp)
	addiu	$2,$fp,136
	move	$6,$2
	lw	$5,156($fp)
	lw	$4,152($fp)
	lw	$2,%got(verifico_signo_igual)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,verifico_signo_igual
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L28
	nop

$L32:
	lw	$2,24($fp)
	lw	$3,152($fp)
	addu	$2,$3,$2
	lb	$2,0($2)
	move	$4,$2
	lw	$2,%got(letra_en_tabla)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,letra_en_tabla
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,36($fp)
	lw	$3,36($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L29
	nop

	li	$2,1			# 0x1
	sb	$2,32($fp)
	b	$L30
	nop

$L29:
	addiu	$2,$fp,40
	li	$7,6			# 0x6
	lw	$6,36($fp)
	lw	$5,28($fp)
	move	$4,$2
	lw	$2,%got(pasar_a_binario)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,pasar_a_binario
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L30:
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
	lw	$2,28($fp)
	addiu	$2,$2,6
	sw	$2,28($fp)
$L28:
	lw	$2,136($fp)
	lw	$3,156($fp)
	subu	$3,$3,$2
	lw	$2,24($fp)
	slt	$2,$2,$3
	beq	$2,$0,$L31
	nop

	lbu	$2,32($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	bne	$2,$0,$L32
	nop

$L31:
	lbu	$2,32($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L33
	nop

	lw	$3,136($fp)
	addiu	$2,$fp,40
	move	$6,$3
	lw	$5,160($fp)
	move	$4,$2
	lw	$2,%got(separador_de_a_ocho)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,separador_de_a_ocho
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L33:
	lw	$2,136($fp)
	lw	$3,156($fp)
	subu	$2,$3,$2
	addiu	$3,$2,-1
	lw	$2,164($fp)
	sw	$3,0($2)
	lbu	$2,32($fp)
	move	$sp,$fp
	lw	$31,148($sp)
	lw	$fp,144($sp)
	addiu	$sp,$sp,152
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	decodificar_base_64
	.size	decodificar_base_64, .-decodificar_base_64
	.align	2
	.globl	cerrar_archivo
	.set	nomips16
	.set	nomicromips
	.ent	cerrar_archivo
	.type	cerrar_archivo, @function
cerrar_archivo:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	lw	$2,%got(stdout)($28)
	lw	$2,0($2)
	lw	$3,32($fp)
	beq	$3,$2,$L37
	nop

	lw	$2,%got(stdin)($28)
	lw	$2,0($2)
	lw	$3,32($fp)
	beq	$3,$2,$L37
	nop

	lw	$2,32($fp)
	beq	$2,$0,$L37
	nop

	lw	$4,32($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L37:
	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	cerrar_archivo
	.size	cerrar_archivo, .-cerrar_archivo
	.align	2
	.globl	verificar_opcion
	.set	nomips16
	.set	nomicromips
	.ent	verificar_opcion
	.type	verificar_opcion, @function
verificar_opcion:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$6,48($fp)
	sw	$7,52($fp)
	sb	$0,24($fp)
	sw	$0,28($fp)
	b	$L39
	nop

$L41:
	lw	$2,28($fp)
	sll	$2,$2,2
	lw	$3,40($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	lw	$5,48($fp)
	move	$4,$2
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L40
	nop

	li	$2,1			# 0x1
	sb	$2,24($fp)
	lw	$2,28($fp)
	addiu	$3,$2,1
	lw	$2,52($fp)
	sw	$3,0($2)
$L40:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L39:
	lw	$3,28($fp)
	lw	$2,44($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L41
	nop

	lbu	$2,24($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	verificar_opcion
	.size	verificar_opcion, .-verificar_opcion
	.align	2
	.globl	separador_de_a_seis
	.set	nomips16
	.set	nomicromips
	.ent	separador_de_a_seis
	.type	separador_de_a_seis, @function
separador_de_a_seis:
	.frame	$fp,64,$31		# vars= 24, regs= 2/2, args= 16, gp= 8
	.mask	0xc0000000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-64
	sw	$31,52($sp)
	sw	$fp,48($sp)
	sdc1	$f20,56($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,64($fp)
	sw	$5,68($fp)
	sw	$6,72($fp)
	sw	$0,24($fp)
	sw	$0,28($fp)
	b	$L44
	nop

$L47:
	sw	$0,32($fp)
	li	$2,5			# 0x5
	sw	$2,36($fp)
	sw	$0,40($fp)
	b	$L45
	nop

$L46:
	lw	$3,28($fp)
	lw	$2,40($fp)
	addu	$2,$3,$2
	sll	$2,$2,2
	lw	$3,64($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	mtc1	$2,$f0
	cvt.d.w	$f20,$f0
	lw	$2,36($fp)
	mtc1	$2,$f0
	cvt.d.w	$f2,$f0
	lw	$2,%got($LC8)($28)
	ldc1	$f0,%lo($LC8)($2)
	mov.d	$f14,$f2
	mov.d	$f12,$f0
	lw	$2,%call16(pow)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,pow
1:	jalr	$25
	nop

	lw	$28,16($fp)
	mul.d	$f0,$f20,$f0
	lw	$2,32($fp)
	mtc1	$2,$f2
	cvt.d.w	$f2,$f2
	add.d	$f0,$f2,$f0
	trunc.w.d $f0,$f0
	mfc1	$2,$f0
	sw	$2,32($fp)
	lw	$2,36($fp)
	addiu	$2,$2,-1
	sw	$2,36($fp)
	lw	$2,40($fp)
	addiu	$2,$2,1
	sw	$2,40($fp)
$L45:
	lw	$2,40($fp)
	slt	$2,$2,6
	bne	$2,$0,$L46
	nop

	lw	$2,28($fp)
	addiu	$2,$2,6
	sw	$2,28($fp)
	lw	$2,%got($LC7)($28)
	addiu	$3,$2,%lo($LC7)
	lw	$2,32($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	sb	$2,44($fp)
	lw	$2,24($fp)
	lw	$3,68($fp)
	addu	$2,$3,$2
	lbu	$3,44($fp)
	sb	$3,0($2)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L44:
	lw	$2,72($fp)
	addiu	$3,$2,1
	lw	$2,24($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L47
	nop

	nop
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	ldc1	$f20,56($sp)
	addiu	$sp,$sp,64
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	separador_de_a_seis
	.size	separador_de_a_seis, .-separador_de_a_seis
	.align	2
	.globl	codificar_base_64
	.set	nomips16
	.set	nomicromips
	.ent	codificar_base_64
	.type	codificar_base_64, @function
codificar_base_64:
	.frame	$fp,144,$31		# vars= 112, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-144
	sw	$31,140($sp)
	sw	$fp,136($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,144($fp)
	sw	$5,148($fp)
	sw	$6,152($fp)
	sw	$0,24($fp)
	sw	$0,28($fp)
	b	$L49
	nop

$L50:
	lw	$2,24($fp)
	lw	$3,144($fp)
	addu	$2,$3,$2
	lb	$2,0($2)
	sw	$2,36($fp)
	addiu	$2,$fp,40
	li	$7,8			# 0x8
	lw	$6,36($fp)
	lw	$5,28($fp)
	move	$4,$2
	lw	$2,%got(pasar_a_binario)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,pasar_a_binario
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
	lw	$2,28($fp)
	addiu	$2,$2,8
	sw	$2,28($fp)
$L49:
	lw	$3,24($fp)
	lw	$2,148($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L50
	nop

	lw	$2,24($fp)
	slt	$2,$2,3
	beq	$2,$0,$L51
	nop

	lw	$2,148($fp)
	sw	$2,32($fp)
	b	$L52
	nop

$L53:
	addiu	$2,$fp,40
	li	$7,2			# 0x2
	move	$6,$0
	lw	$5,28($fp)
	move	$4,$2
	lw	$2,%got(pasar_a_binario)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,pasar_a_binario
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,32($fp)
	addiu	$2,$2,1
	lw	$3,152($fp)
	addu	$2,$3,$2
	li	$3,61			# 0x3d
	sb	$3,0($2)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
	lw	$2,28($fp)
	addiu	$2,$2,2
	sw	$2,28($fp)
$L52:
	lw	$2,32($fp)
	slt	$2,$2,3
	bne	$2,$0,$L53
	nop

$L51:
	addiu	$2,$fp,40
	lw	$6,148($fp)
	lw	$5,152($fp)
	move	$4,$2
	lw	$2,%got(separador_de_a_seis)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,separador_de_a_seis
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	move	$sp,$fp
	lw	$31,140($sp)
	lw	$fp,136($sp)
	addiu	$sp,$sp,144
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	codificar_base_64
	.size	codificar_base_64, .-codificar_base_64
	.rdata
	.align	2
$LC9:
	.ascii	"r\000"
	.text
	.align	2
	.globl	abrir_archivo_lectura
	.set	nomips16
	.set	nomicromips
	.ent	abrir_archivo_lectura
	.type	abrir_archivo_lectura, @function
abrir_archivo_lectura:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	sw	$5,36($fp)
	sw	$6,40($fp)
	lw	$2,36($fp)
	slt	$2,$2,3
	bne	$2,$0,$L55
	nop

	lw	$3,40($fp)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L55
	nop

	lw	$2,40($fp)
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got($LC9)($28)
	addiu	$5,$2,%lo($LC9)
	move	$4,$3
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L56
	nop

$L55:
	move	$2,$0
$L56:
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	abrir_archivo_lectura
	.size	abrir_archivo_lectura, .-abrir_archivo_lectura
	.rdata
	.align	2
$LC10:
	.ascii	"w\000"
	.text
	.align	2
	.globl	abrir_archivo_escritura
	.set	nomips16
	.set	nomicromips
	.ent	abrir_archivo_escritura
	.type	abrir_archivo_escritura, @function
abrir_archivo_escritura:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	sw	$5,36($fp)
	sw	$6,40($fp)
	lw	$3,40($fp)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L58
	nop

	lw	$2,40($fp)
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got($LC10)($28)
	addiu	$5,$2,%lo($LC10)
	move	$4,$3
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L59
	nop

$L58:
	move	$2,$0
$L59:
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	abrir_archivo_escritura
	.size	abrir_archivo_escritura, .-abrir_archivo_escritura
	.rdata
	.align	2
$LC11:
	.ascii	"-h\000"
	.align	2
$LC12:
	.ascii	"-V\000"
	.align	2
$LC13:
	.ascii	"Version: big endian\000"
	.align	2
$LC14:
	.ascii	"-i\000"
	.align	2
$LC15:
	.ascii	"no se pudo abrir el archivo para lectura\000"
	.align	2
$LC16:
	.ascii	"-o\000"
	.align	2
$LC17:
	.ascii	"no se pudo abrir el archivo para escritura\000"
	.align	2
$LC18:
	.ascii	"-d\000"
	.align	2
$LC19:
	.ascii	" \012Archivo codificado\000"
	.align	2
$LC20:
	.ascii	" \012Archivo decodificado\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,80,$31		# vars= 48, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-80
	sw	$31,76($sp)
	sw	$fp,72($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,80($fp)
	sw	$5,84($fp)
	lw	$2,%got(stdin)($28)
	lw	$2,0($2)
	sw	$2,24($fp)
	lw	$2,%got(stdout)($28)
	lw	$2,0($2)
	sw	$2,28($fp)
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,36($fp)
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,40($fp)
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,44($fp)
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,48($fp)
	addiu	$2,$fp,48
	move	$7,$2
	lw	$2,%got($LC11)($28)
	addiu	$6,$2,%lo($LC11)
	lw	$5,80($fp)
	lw	$4,84($fp)
	lw	$2,%got(verificar_opcion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,verificar_opcion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L61
	nop

	lw	$2,%got(mostrar_ayudas)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,mostrar_ayudas
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	b	$L73
	nop

$L61:
	addiu	$2,$fp,48
	move	$7,$2
	lw	$2,%got($LC12)($28)
	addiu	$6,$2,%lo($LC12)
	lw	$5,80($fp)
	lw	$4,84($fp)
	lw	$2,%got(verificar_opcion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,verificar_opcion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L63
	nop

	lw	$2,%got($LC13)($28)
	addiu	$4,$2,%lo($LC13)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	b	$L73
	nop

$L63:
	addiu	$2,$fp,36
	move	$7,$2
	lw	$2,%got($LC14)($28)
	addiu	$6,$2,%lo($LC14)
	lw	$5,80($fp)
	lw	$4,84($fp)
	lw	$2,%got(verificar_opcion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,verificar_opcion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L64
	nop

	lw	$2,36($fp)
	move	$6,$2
	lw	$5,80($fp)
	lw	$4,84($fp)
	lw	$2,%got(abrir_archivo_lectura)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,abrir_archivo_lectura
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L64
	nop

	lw	$2,%got($LC15)($28)
	addiu	$4,$2,%lo($LC15)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	b	$L73
	nop

$L64:
	addiu	$2,$fp,44
	move	$7,$2
	lw	$2,%got($LC16)($28)
	addiu	$6,$2,%lo($LC16)
	lw	$5,80($fp)
	lw	$4,84($fp)
	lw	$2,%got(verificar_opcion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,verificar_opcion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L65
	nop

	lw	$2,44($fp)
	move	$6,$2
	lw	$5,80($fp)
	lw	$4,84($fp)
	lw	$2,%got(abrir_archivo_escritura)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,abrir_archivo_escritura
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L65
	nop

	lw	$2,%got($LC17)($28)
	addiu	$4,$2,%lo($LC17)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,24($fp)
	lw	$2,%got(cerrar_archivo)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,cerrar_archivo
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	b	$L73
	nop

$L65:
	addiu	$2,$fp,40
	move	$7,$2
	lw	$2,%got($LC18)($28)
	addiu	$6,$2,%lo($LC18)
	lw	$5,80($fp)
	lw	$4,84($fp)
	lw	$2,%got(verificar_opcion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,verificar_opcion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L66
	nop

	sw	$0,56($fp)
	sb	$0,60($fp)
	lw	$2,%got($LC19)($28)
	addiu	$4,$2,%lo($LC19)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L67
	nop

$L68:
	addiu	$2,$fp,52
	move	$4,$2
	lw	$2,%got(contar_leido)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,contar_leido
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	addiu	$3,$fp,56
	addiu	$2,$fp,52
	move	$6,$3
	lw	$5,32($fp)
	move	$4,$2
	lw	$2,%got(codificar_base_64)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,codificar_base_64
1:	jalr	$25
	nop

	lw	$28,16($fp)
	addiu	$2,$fp,56
	lw	$7,28($fp)
	li	$6,4			# 0x4
	li	$5,1			# 0x1
	move	$4,$2
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	addiu	$2,$fp,52
	li	$6,4			# 0x4
	move	$5,$0
	move	$4,$2
	lw	$2,%call16(memset)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memset
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L67:
	addiu	$2,$fp,52
	lw	$6,24($fp)
	li	$5,4			# 0x4
	move	$4,$2
	lw	$2,%call16(fgets)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fgets
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L68
	nop

	b	$L69
	nop

$L66:
	lw	$2,%got($LC20)($28)
	addiu	$4,$2,%lo($LC20)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sb	$0,64($fp)
	sb	$0,65($fp)
	sb	$0,66($fp)
	sb	$0,67($fp)
	b	$L70
	nop

$L72:
	sw	$0,68($fp)
	addiu	$4,$fp,68
	addiu	$3,$fp,64
	addiu	$2,$fp,52
	move	$7,$4
	move	$6,$3
	li	$5,4			# 0x4
	move	$4,$2
	lw	$2,%got(decodificar_base_64)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,decodificar_base_64
1:	jalr	$25
	nop

	lw	$28,16($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L71
	nop

	lw	$2,68($fp)
	move	$3,$2
	addiu	$2,$fp,64
	lw	$7,28($fp)
	move	$6,$3
	li	$5,1			# 0x1
	move	$4,$2
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L71:
	addiu	$2,$fp,52
	li	$6,4			# 0x4
	move	$5,$0
	move	$4,$2
	lw	$2,%call16(memset)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memset
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L70:
	addiu	$2,$fp,52
	lw	$6,24($fp)
	li	$5,5			# 0x5
	move	$4,$2
	lw	$2,%call16(fgets)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fgets
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L72
	nop

$L69:
	lw	$4,24($fp)
	lw	$2,%got(cerrar_archivo)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,cerrar_archivo
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,28($fp)
	lw	$2,%got(cerrar_archivo)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,cerrar_archivo
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
$L73:
	move	$sp,$fp
	lw	$31,76($sp)
	lw	$fp,72($sp)
	addiu	$sp,$sp,80
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.rdata
	.align	3
$LC8:
	.word	1073741824
	.word	0
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
