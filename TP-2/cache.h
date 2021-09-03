#ifndef CACHE_H
#define CACHE_H
#define TAMANIO_MEMORIA_PRINCIPAL 64 * 1024 * 8//en KB
#include <stdlib.h>

typedef struct bloque{
  int direccion;
  char* data;
  int tamanio_bloque;
  unsigned int dirty;
  unsigned int valid;
  unsigned short tag;
}bloque_t;

typedef struct memoria_principal{
  int capacidad;
  bloque_t** bloques;
  int cantidad_de_bloques;
}memoria_principal_t;

typedef struct conjunto{
  bloque_t** bloques;
  int cantidad_de_bloques;
  int bloques_ocupados;
  int* distancia_lru;
}conjunto_t;

typedef struct cache{
  conjunto_t** conjuntos;
  float cantidad_de_accesos;
  float cantidad_de_misses;
  int memoria_ocupada;
  int cantidad_de_conjuntos;
  int numero_de_vias;
  int bits_de_index;
  int bits_de_offset;
}cache_t;


/*inicializa los bloques de la caché como inválidos,
 la memoria simulada en 0 y la tasa de misses a 0*/
void init();

/*devuelve el conjunto de caché al que mapea la dirección address.*/
unsigned int find_set(int address);

/*devuelve el bloque menos recientemente usado dentro de un conjunto
(o alguno de ellos si hay más de uno), utilizando
 el campo correspondiente de los metadatos de los bloques del conjunto.*/
unsigned int find_lru(int setnum);

/*devuelve el estado del bit D del bloque correspondiente.*/
unsigned int is_dirty(int way, int setnum);

/*lee el bloque blocknum de memoria y lo guarda en
el lugar que le corresponda en la memoria caché.*/
void read_block(int blocknum);

/*escribe en memoria los datos contenidos en el bloque setnum de la via way.*/
void write_block(int way, int setnum);

/*retorna el valor correspondiente a la
posición de memoria address, buscándolo primero en el caché.*/
char read_byte(int address);

/*escribe el valor value en la posición correcta del bloque que corresponde a
address.*/
void write_byte(int address, char value);

/*debe devolver el porcentaje de misses desde que se inicializó el cache*/
float get_miss_rate();

/*desinicializa las estructuras*/
void uninit();

#endif
