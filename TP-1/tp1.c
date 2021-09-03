//El programa deber´a retornar un error si sus argumentos est´an fuera del rango [2, MAXINT].
#include <stdio.h>
//#include "algoritmos.h"
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#define ERROR -1
#define COMANDO_HELP "-h"
#define COMANDO_VERSION "-V"
#define COMANDO_OUTPUT "-o"
#define COMANDO_MULTIPLO "-m"
#define COMANDO_DIVISOR "-d"
#define COMANDO_STDOUT "-"

extern unsigned int mcd(unsigned int m, unsigned int n);
extern unsigned int mcm(unsigned int m, unsigned int n);

void mostrar_opciones(){

  fprintf(stdout,"Usage\ncommon -h\ncommon -V\ncommon [options] M N\nOptions:\n");
  fprintf(stdout,"-h, --help Prints usage information.\n");
  fprintf(stdout,"-V, --version Prints version information.\n");
  fprintf(stdout,"-o, --output Path to output file.\n");
  fprintf(stdout,"-d --divisor Just the divisor.\n");
  fprintf(stdout,"-m --multiple Just the multiple\n");
  fprintf(stdout,"-Examples:\ncommon -o - 256 192\n");

}

bool verificar_opcion(char const* argv[],int cant_argumentos,char* comando,int* pos_comando){
    bool esta = false;
    for(int i = 0; i < cant_argumentos; i++){
        if(strcmp(argv[i],comando) == 0){
            esta = true;
            *pos_comando = i + 1;
        }
    }
    return esta;
}

int main(int argc,const char* argv[]){

  long valor_min = 0, valor_max = 0;
  unsigned int res_mcm = 0,res_mcd = 0;

  int pos_output = ERROR,pos_default = ERROR;
  FILE* file_output = stdout;
  if  (argc < 1 && !verificar_opcion(argv,argc,COMANDO_HELP,&pos_default)){
    fprintf(stderr,"ERROR:FALTAN ARGUMENTOS.INGRESE EL COMANDO -h PARA VER LAS OPCIONES DISPONIBLES\n");
    return 0;
  }
  if (verificar_opcion(argv,argc,COMANDO_HELP,&pos_default)){
    mostrar_opciones();
    return 0;
  }else if (verificar_opcion(argv,argc,COMANDO_VERSION,&pos_default)){
    fprintf(stdout,"la version es: Calculadora de mcd y mcm mediante el algoritmo de Euclides\n");
    return 0;
  }

  valor_min = atol(argv[argc - 2]);
  valor_max = atol(argv[argc - 1]);

  if (verificar_opcion(argv,argc,COMANDO_OUTPUT,&pos_output)){
    /*if (!verificar_opcion(argv,argc,COMANDO_STDOUT,&pos_default) && (pos_output + 1 < argc)){
      file_output = fopen(argv[pos_output + 1],"r");
    }*/
    if (file_output == NULL || (pos_output + 1 >= argc)){
      fprintf(stderr,"ERROR:NO SE PUDO ABRIR EL ARCHIVO DE SALIDA\n");
    }
  }
  if (valor_min < 2 || valor_max > 4294967295){
    fprintf(stderr,"ERROR:LOS VALORES INGRESADOS DEBEN ESTAR EN EL RANGO [2,4294967295]\n");
    return 1;
  }else if ((valor_max < valor_min)){
    fprintf(stderr,"ERROR:EL EL PRIMER VALOR INGRESADO DEBE SER MENOR QUE EL SEGUNDO\n");
  }
  if (verificar_opcion(argv,argc,COMANDO_DIVISOR,&pos_default)){
      res_mcd = mcd((unsigned int)valor_min,(unsigned int)valor_max);
      fprintf(file_output,"Para los valores (%ld,%ld)\nmcd = %u\n",valor_min,valor_max,res_mcd);

  }else if (verificar_opcion(argv,argc,COMANDO_MULTIPLO,&pos_default)){
      res_mcm = mcm((unsigned int)valor_min,(unsigned int)valor_max);
      fprintf(file_output,"Para los valores (%ld,%ld)\nmcm = %u\n",valor_min,valor_max,res_mcm);
      if (res_mcm == 0){
          fprintf(stderr, "ERROR: el mcm no es representable en 32 bits\n");
      }

  }else{
      res_mcd = mcd((unsigned int)valor_min,(unsigned int)valor_max);
      res_mcm = mcm((unsigned int)valor_min,(unsigned int)valor_max);
      fprintf(file_output,"Para los valores (%ld,%ld)\nmcm = %u\nmcd = %u\n",valor_min,valor_max,res_mcm,res_mcd);
      if (res_mcm == 0){
          fprintf(stderr, "ERROR: el mcm no es representable en 32 bits\n");
      }
  }
  if (file_output != stdout){
    fclose(file_output);
  }
  return 0;

}
