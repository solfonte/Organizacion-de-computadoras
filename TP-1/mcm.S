#include <sys/regdef.h>

/*sra*/
#define SS 44
#define O_FP 36
#define O_GP 32
#define O_RA 28

/*lta*/
#define O_M 24
#define O_N 20

/*aba del caller*/
#define O_A0 48
#define O_A1 44

/*unsigned int mcm(unsigned int m, unsigned int n)*/
.text
.align 2
.extern mcd 24
.globl mcm
.ent mcm

mcm:

/*sra*/
  subu sp, sp, SS
  sw   fp, O_FP(sp)
  sw   gp, O_GP(sp)
  sw   ra, O_RA(sp)
  move fp, sp

/*aba*/
  sw   a0, O_A0(fp)     #m
  sw   a1, O_A1(fp)     #n

/*lta*/

  lw  t0, O_A0(fp)      #cargo en t0 el valor de m
  sw  t0, O_M(fp)       #guardo en otro espacio temporal el valor de m

  lw  t1, O_A1(fp)      #cargo en t1 el valor de n
  sw  t1, O_N(fp)       #guardo en otro espacio temporal el valor de n


  mult t0,t1          #m*n
  mfhi t2             #cargamos los 32 bits mas significativos del resultado
  mflo t3             #cargamos los 32 bits menos significativos del resultado
  beqz t2, division
  li v0,0             #cargamos el registro v0 con cero para devolver error
  b return

division:
  lw a0, O_A0(fp)
  lw a1, O_A1(fp)
  bal mcd
  move t0,v0         #cargamos el resultado de mcd en t0
  divu t3,t0         #division de (m*n) / mcd(m,n)
  mflo t1           #cargamos resultado de la division en t1
  move v0,t1        #cargamos el resultado en el registro de retorno

  return:
  /*stack unwinding*/
    lw    fp, O_FP(sp)
    lw    gp, O_GP(sp)
    lw    ra, O_RA(sp)
    addiu sp, sp, SS
    jr ra
.end mcm
