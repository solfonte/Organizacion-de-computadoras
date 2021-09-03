#include <sys/regdef.h>
/*sra*/
#define SS 16
#define O_FP 12
#define O_GP 8

/*lta*/
#define O_M 4
#define O_N 0

/*aba del caller*/
#define O_A0 16
#define O_A1 20

.text
.align 2
.globl mcd
.ent mcd
/*unsigned int mcd(unsigned int m, unsigned int n)*/

mcd:

/*sra*/
  subu sp, sp, SS
  sw   fp, O_FP(sp)
  sw   gp, O_GP(sp)
  move fp, sp

/*aba*/
  sw   a0, O_A0(fp)     #m
  sw   a1, O_A1(fp)     #n

/*lta*/

  lw  t0, O_A0(fp)      #cargo en t0 el valor de m
  sw  t0, O_M(fp)       #guardo en otro espacio temporal el valor de m

  blez t0, return       #si m es menor o igual a 0 vuelvo

  lw  t1, O_A1(fp)      #cargo en t1 el valor de n
  sw  t1, O_N(fp)       #guardo en otro espacio temporal el valor de n


mcd_loop:

modulo:
  sub t2, t1, t0        #t2 <- operacion modulo n % m
  bltz t2, carga        #si t2 es menor a cero saltamos a la carga
  move t1,t2            #movemos lo que tiene t2 a t1
  b modulo

carga:
  add  t2, t0           #cargamos el valor del modulo en t0
  sw   t2, O_M(fp)      #guardo el valor obtenido de la operacion modulo en m temporal
  sw   t0, O_N(fp)      #cargo m temporal en n temporal
  lw   t0, O_M(fp)      #vuelvo a cargar en t0 el valor de m
  lw   t1, O_N(fp)      #vuelvo a cargar  en t0 el valor de n

  bgtz t2, mcd_loop


return:
  lw v0, O_N(fp)        #cargo el valor final de n en v0

/*stack unwinding*/
  lw    fp, O_FP(sp)
  lw    gp, O_GP(sp)
  addiu sp, sp, SS
  jr ra

.end mcd
