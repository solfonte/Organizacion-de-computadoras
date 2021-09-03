#include "cache.h"
#include <stdlib.h>
#include <stdio.h>
#define MAX_LINEA 100

void leer_archivo(char* arg_archivo){
    FILE* archivo = fopen(arg_archivo, "r");
    if(!archivo){
      fprintf(stderr,"Ocurrio un fallo al intentar abrir el archivo\n");
        return;
    }
    char linea[MAX_LINEA];

    while (fgets(linea, MAX_LINEA-1, archivo) != NULL){

        int address = 0;
        char value = 0;
        float miss_rate = 0;
        char byte = 0;
        switch(linea[0]){
            case 'W':
                sscanf(linea+2, "%i, %c\n", &address, &value);
                write_byte(address, value);
                break;
            case 'R':
                sscanf(linea+2, "%i\n", &address);
                byte = read_byte(address);
                printf("El bit leido es %c\n",byte);
                break;
            case 'M':
                miss_rate = get_miss_rate();
                printf("El miss rate es de: %f\n",miss_rate);
                break;
        }
    }
    fclose(archivo);
    return;
}
