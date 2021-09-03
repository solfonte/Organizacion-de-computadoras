#include "cache.h"
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include "parseador.h"

#define COMANDO_HELP 'h'
#define COMANDO_VERSION 'V'
#define COMANDO_VIAS 'w'
#define COMANDO_BLOQUES 'b'
#define COMANDO_CACHE 'c'

extern char *optarg;

int vias_por_conjunto = -1,tamanio_de_cache = -1,tamanio_de_bloque = -1;
cache_t cache;
memoria_principal_t mp;

void mostrar_version(){
  fprintf(stdout,"Version: simulador de memoria cache con las siguientes caracteristicas:\n");
  fprintf(stdout,"-Asociativa por conjuntos.\n");
  fprintf(stdout,"-Politica de reemplazo LRU.\n");
  fprintf(stdout,"-Politica de escritura WB/WA.\n");
  fprintf(stdout,"-Espacio de direcciones de 16 bits.\n");
}

void mostrar_ayuda(){
  fprintf(stdout,"Usage:\n tp2 -h\ntp2 -V\n");
  fprintf(stdout,"Options:\n-h, --help\tImprime ayuda.\n");
  fprintf(stdout,"-V, --version\tVersión del programa.\n");
  fprintf(stdout,"-o, --output\tArchivo de salida.\n");
  fprintf(stdout,"-w, --ways\tCantidad de vı́as.\n");
  fprintf(stdout,"-c, --cachesize\tTamanio del caché en kilobytes.\n");
  fprintf(stdout,"-b, --blocksize\tTamanio de bloque en bytes.\n");
}

int main(int argc, char* argv[]) {
  if (argc < 2){
    fprintf(stderr,"ERROR:faltan argumentos. Ingrese:\ntp2 -h \npara ver los comandos soportados\n");
    return 0;
  }
  int opt = getopt(argc, argv,"hVo:w:b:c:");
  while (opt != -1){
    switch (opt){
      case COMANDO_HELP:
        mostrar_ayuda();
        break;
      case COMANDO_VERSION:
        mostrar_version();
        break;
      case COMANDO_VIAS:
        vias_por_conjunto = atoi(optarg);
        break;
      case COMANDO_BLOQUES:
        tamanio_de_bloque = atoi(optarg);
        break;
      case COMANDO_CACHE:
        tamanio_de_cache = atoi(optarg);
        break;
      default:
        fprintf(stderr,"Ingrese:\ntp2 -h \npara ver los comandos soportados\n");
        break;
    }
    opt = getopt(argc, argv,"hVow:b:c:");
  }

  init();
  leer_archivo(argv[argc-1]);
  uninit();

  return 0;
}
