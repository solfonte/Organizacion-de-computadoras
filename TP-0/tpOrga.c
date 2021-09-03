#define COMANDO_HELP "-h"
#define COMANDO_VERSION "-V"
#define COMANDO_OUTPUT "-o"
#define COMANDO_INPUT "-i"
#define COMANDO_DECODE "-d"
#define TAMANIO_BUFFER 4
#define MAXIMO_TAMANIO_OPCIONES 5
#define TAMANIO_BUFFER_CODIFICADO 5
#define TAMANIO_BUFFER_BINARIO 24
#define ERROR -1
#define TABLA "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int leer(char* buffer,int* resultado,FILE* file_input){
  int i = 0;
  unsigned char letra = 0;
  while(*resultado != EOF && i < 3){
    *resultado = getc(file_input);
    if(*resultado != EOF){
      letra = (unsigned char) *resultado;
      buffer[i] = (char)(*resultado);
      i++;
    }
  }
  return i;
}

void mostrar_ayudas(){
  printf("$ tp0 -h\n");
  printf("Usage:tp0 -h\ntp0 -V\ntp0 [options]\nOptions:\n");
  printf("-V, --version\tPrint version and quit.\n");
  printf("-h, --help\tPrint this information.\n");
  printf("-o, --output\tPath to output file.\n");
  printf("-i, --input\tPath to input file.\n");
  printf("-d, --decode\tDecode a base64-encoded file.\n");

}

bool verifico_signo_igual(char* buffer,int tamanio,int* cantidad_s_igual){
    bool hay_igual = false;
    for(int i = 0;i < tamanio; i++){
      if(buffer[i] == '='){
        *cantidad_s_igual = *cantidad_s_igual + 1;
        hay_igual = true;
      }
    }
    return hay_igual;
}

int letra_en_tabla(char letra){
    bool encontre = false;
    int i = 0, pos_letra = 0;
    while(!encontre && i < 64){
       if(letra == TABLA[i]){
           encontre = true;
           pos_letra = i;
       }
    i++;
  }
  return (encontre == true?pos_letra:ERROR);
}

void pasar_a_binario(int* aux,int posicion,int letra_en_ascii,int cantidad_bits){
    int modulo, contador = 0;
    int posicion_menos_significativa = posicion + cantidad_bits - 1;
    do{
        modulo = letra_en_ascii % 2;
        letra_en_ascii = letra_en_ascii / 2;
        aux[posicion_menos_significativa - contador] = modulo;
        contador++;
    }while(contador < cantidad_bits);
}

void separador_de_a_ocho(int* aux,char* buffer_decodificado,int cantidad_s_igual){
    int i = 0, posicion = 0, iteraciones = 3 - cantidad_s_igual;
    while(i < iteraciones){
        int letra_en_ascii = 0;
        int exp = 7;
        for (int i = 0; i < 8; i++){
    	     letra_en_ascii += aux[posicion + i] * pow(2, exp);
    	     exp--;
        }
        posicion = posicion + 8;
        char letra = (char)letra_en_ascii;
        buffer_decodificado[i] = letra;
        i++;
    }

}

bool decodificar_base_64(char* buffer,int tamanio,char* buffer_decodificado,int* descifrado){

    int i = 0, posicion = 0, letra_en_ascii, aux[TAMANIO_BUFFER_BINARIO], cantidad_s_igual = 0;
    bool termine = false;
    verifico_signo_igual(buffer,tamanio,&cantidad_s_igual);
    while(i < (tamanio - cantidad_s_igual) && !termine){
        letra_en_ascii = letra_en_tabla(buffer[i]);
        if(letra_en_ascii == ERROR){
            termine = true;
        }else{
            pasar_a_binario(aux,posicion,letra_en_ascii,6);
        }
        i++;
        posicion +=6;
    }
    if(!termine){
        separador_de_a_ocho(aux,buffer_decodificado,cantidad_s_igual);
    }
    *descifrado = tamanio - cantidad_s_igual - 1;
    return termine;
}

void cerrar_archivo(FILE* file){
    if(file != stdout && file != stdin && file != NULL){
        fclose(file);
    }
}

bool verificar_opcion(char const *argv[],int cant_argumentos,char* comando,int* pos_comando){
    bool esta = false;
    for(int i = 0; i < cant_argumentos; i++){
        if(strcmp(argv[i],comando) == 0){
            esta = true;
            *pos_comando = i + 1;
        }
    }
    return esta;
}

void separador_de_a_seis(int* aux,char buffer_codificado[4],int leido){

    int i = 0, posicion = 0;
    while(i < leido + 1){
        int letra_en_ascii = 0;
        int exp = 5;
        for (int i = 0; i < 6; i++){
          letra_en_ascii += aux[posicion + i] * pow(2, exp);
          exp--;
        }
        posicion = posicion + 6;
        char letra = TABLA[letra_en_ascii];
        buffer_codificado[i] = letra;
        i++;
    }
}

void codificar_base_64(char* buffer,int leido,char buffer_codificado[4]){
    int i = 0, posicion = 0, letra_en_ascii, aux[TAMANIO_BUFFER_BINARIO];
    while(i < leido){
        letra_en_ascii = (int)buffer[i];
        pasar_a_binario(aux,posicion,letra_en_ascii,8);
        i++;
        posicion += 8;
    }
    if(i < 3){
      int j = leido;
      while(j < 3){
        pasar_a_binario(aux,posicion,0,2);
        buffer_codificado[j + 1] = '=';
        i++;
        j++;
        posicion += 2;
      }
    }
    separador_de_a_seis(aux,buffer_codificado,leido);
}

FILE* abrir_archivo_lectura(char const *argv[],int argc,int pos_file){
  if (argc > 2 && pos_file != ERROR){
        return fopen(argv[pos_file],"r");
  }
  return NULL;
}

FILE* abrir_archivo_escritura(char const *argv[],int argc,int pos_file){
    if(pos_file != ERROR) {
        return fopen(argv[pos_file],"w");
    }
    return NULL;
}

int main(int argc, char const *argv[]) {

    FILE* file_input = stdin;
    FILE* file_output = stdout;
    int pos_input = ERROR,pos_decode = ERROR,pos_output = ERROR, aux = ERROR;

    if (verificar_opcion(argv,argc,COMANDO_HELP,&aux)){
        mostrar_ayudas();
        return 0;
    } else if (verificar_opcion(argv,argc,COMANDO_VERSION,&aux)){
        printf("Version: codificacion y decodificacion en base 64\n");
        return 0;
    }

    if(verificar_opcion(argv,argc,COMANDO_INPUT,&pos_input)){
        file_input = abrir_archivo_lectura(argv,argc,pos_input);
        if(file_input == NULL){
            printf("no se pudo abrir el archivo para lectura\n");
            return 0;
        }
    }

    if(verificar_opcion(argv,argc,COMANDO_OUTPUT,&pos_output)){
        file_output = abrir_archivo_escritura(argv,argc,pos_output);
        if(file_output == NULL){
            printf("no se pudo abrir el archivo para escritura\n");
            cerrar_archivo(file_input);
            return 0;
          }
    }

    char buffer[TAMANIO_BUFFER];
    if(!verificar_opcion(argv,argc,COMANDO_DECODE,&pos_decode)){
        char buffer_codificado[TAMANIO_BUFFER_CODIFICADO] = {0,0,0,0};
        int resultado = 1;
        while(resultado != EOF){
            int leido = leer(buffer,&resultado,file_input);
            if(leido != 0){
              codificar_base_64(buffer,leido,buffer_codificado);
              fwrite(buffer_codificado, 1, 4, file_output);
              memset(buffer,0,TAMANIO_BUFFER);
            }
        }
    }else{

        char buffer_decodificado[4] = {0,0,0,0};
        while(fgets(buffer,5,file_input) != NULL){
            int descifrado = 0;
            if(!decodificar_base_64(buffer,4,buffer_decodificado,&descifrado)){
                fwrite(buffer_decodificado, 1, descifrado, file_output);
            }
            memset(buffer,0,TAMANIO_BUFFER);
        }
    }
    cerrar_archivo(file_input);
    cerrar_archivo(file_output);
    return 0;
}
