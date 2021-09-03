#include "cache.h"
#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#define ESPACIO_DE_DIRECCIONES 16

extern int vias_por_conjunto,tamanio_de_cache,tamanio_de_bloque;
extern memoria_principal_t mp;
extern cache_t cache;

void aumentar_distancia_lru(int* distancias_lru,int bloque_recien_accedido,int bloques_ocupados){
  for (int i = 0; i < bloques_ocupados; i++){
    if (i != bloque_recien_accedido) distancias_lru[i]++;
  }
}

void copiar_bloques(bloque_t* bloque_data,bloque_t* bloque_nuevo){
  if (bloque_nuevo->data == NULL){
  bloque_nuevo->data = calloc(1,sizeof(char) * tamanio_de_bloque);
  }
  strncpy(bloque_nuevo->data,bloque_data->data,tamanio_de_bloque);
  bloque_nuevo->tamanio_bloque = bloque_data->tamanio_bloque;
}

void aniadir_bloque(bloque_t* bloque_aniadir,conjunto_t* conjunto,int setnum){
  if (conjunto->bloques_ocupados == conjunto->cantidad_de_bloques){
    int lru = find_lru(setnum);
    if (conjunto->bloques[lru]->dirty == 1){
      write_block(lru,setnum);
    }
    conjunto->bloques[lru]->valid = 0;
    conjunto->bloques_ocupados--;
  }
    int i = 0;
    bool almacene = false;
    while (!almacene && i < vias_por_conjunto){
      if (conjunto->bloques[i]->valid == 0){
        copiar_bloques(bloque_aniadir,conjunto->bloques[i]);
        unsigned short add = bloque_aniadir->direccion;
        unsigned short tag = (add << (cache.bits_de_index)) >> (cache.bits_de_index + cache.bits_de_offset);
        conjunto->bloques[i]->direccion = add;
        conjunto->bloques[i]->tag = tag;
        conjunto->bloques[i]->valid = 1;
        conjunto->bloques_ocupados++;
        almacene = true;
      }
      i++;
    }
  }

void read_block(int blocknum){
  bloque_t* bloque = mp.bloques[blocknum];
  int conjunto_a_mapear = find_set(bloque->direccion);
  aniadir_bloque(bloque,cache.conjuntos[conjunto_a_mapear],conjunto_a_mapear);
}

unsigned int find_lru(int setnum){
  unsigned int mayor_distancia = 0;
  for (int i = 0; i < vias_por_conjunto; i++){
    if (cache.conjuntos[setnum]->distancia_lru[i] > cache.conjuntos[setnum]->distancia_lru[mayor_distancia]){
      mayor_distancia = i;
    }
  }
  return mayor_distancia;
}

int obtener_numero_de_bloque_en_mp(int address){
   return address / tamanio_de_bloque;
}

void write_block(int way, int setnum){
  bloque_t* bloque_dirty = cache.conjuntos[setnum]->bloques[way];
  int blocknum = obtener_numero_de_bloque_en_mp(bloque_dirty->direccion);
  copiar_bloques(bloque_dirty,mp.bloques[blocknum]);
}

void write_byte(int address, char value){
  unsigned short add = address;
  unsigned short conjunto_a_mapear = find_set(address);
  unsigned short offset = (add << (ESPACIO_DE_DIRECCIONES - cache.bits_de_offset));
  offset = offset >> (ESPACIO_DE_DIRECCIONES - cache.bits_de_offset);
  unsigned short tag = (add << cache.bits_de_index) >> (cache.bits_de_index + cache.bits_de_offset);
  int i = 0;
  bool esta_en_cache = false;
  while (i < vias_por_conjunto && !esta_en_cache){
    if (cache.conjuntos[conjunto_a_mapear]->bloques[i]->valid == 1 && cache.conjuntos[conjunto_a_mapear]->bloques[i]->tag == tag){
      esta_en_cache = true;
      cache.conjuntos[conjunto_a_mapear]->bloques[i]->data[offset] = value;
      cache.conjuntos[conjunto_a_mapear]->bloques[i]->dirty = 1;
    }
    i++;
  }
  if (!esta_en_cache){
    cache.cantidad_de_misses++;
    int blocknum = obtener_numero_de_bloque_en_mp(address);
    read_block(blocknum);
    i = 0;
    while (i < vias_por_conjunto && !esta_en_cache){
      if (cache.conjuntos[conjunto_a_mapear]->bloques[i]->valid == 1 && cache.conjuntos[conjunto_a_mapear]->bloques[i]->tag == tag){
        esta_en_cache = true;
        cache.conjuntos[conjunto_a_mapear]->bloques[i]->data[offset] = value;
        cache.conjuntos[conjunto_a_mapear]->bloques[i]->dirty = 1;
      }
      i++;
    }
  }
  aumentar_distancia_lru(cache.conjuntos[conjunto_a_mapear]->distancia_lru,i,cache.conjuntos[conjunto_a_mapear]->bloques_ocupados);
  cache.cantidad_de_accesos++;
}

char read_byte(int address){
  unsigned short conjunto_a_mapear = find_set(address);
  unsigned short add = address;
  unsigned short tag = (add << cache.bits_de_index) >> (cache.bits_de_index + cache.bits_de_offset);
  unsigned short offset = add << (ESPACIO_DE_DIRECCIONES - cache.bits_de_offset);
  offset = offset >> (ESPACIO_DE_DIRECCIONES - cache.bits_de_offset);
  bool encontre = false;
  int i = 0;
  char data = 0;
  while (i < vias_por_conjunto && !encontre){
    if(cache.conjuntos[conjunto_a_mapear]->bloques[i]->valid == 1 && cache.conjuntos[conjunto_a_mapear]->bloques[i]->tag == tag){
      encontre = true;
      data = cache.conjuntos[conjunto_a_mapear]->bloques[i]->data[offset];
    }
    i++;
  }
  if (!encontre){
    cache.cantidad_de_misses++;
    int blocknum = obtener_numero_de_bloque_en_mp(address);
    read_block(blocknum);
  while (i < vias_por_conjunto && !encontre){
    if(cache.conjuntos[conjunto_a_mapear]->bloques[i]->valid == 1 && cache.conjuntos[conjunto_a_mapear]->bloques[i]->tag == tag){
      encontre = true;
      data = cache.conjuntos[conjunto_a_mapear]->bloques[i]->data[offset];
    }
    i++;
  }
  }else{
    aumentar_distancia_lru(cache.conjuntos[conjunto_a_mapear]->distancia_lru,i,cache.conjuntos[conjunto_a_mapear]->bloques_ocupados);
    cache.cantidad_de_accesos++;
  }
  return data;

}


unsigned int find_set(int address){
  unsigned short add = (short)address;
  unsigned short index = add >> (ESPACIO_DE_DIRECCIONES - cache.bits_de_index);
  return index % cache.cantidad_de_conjuntos;
}

float get_miss_rate(){
  return (cache.cantidad_de_misses/cache.cantidad_de_accesos);
}

unsigned int is_dirty(int way, int setnum){
  return cache.conjuntos[setnum]->bloques[way]->dirty;
}

void inicializar_bloques(bloque_t** bloques,int cantidad){
  int direccion = 0;
  for (int i = 0; i < cantidad; i++){
    bloque_t* bloque = calloc(1,sizeof(bloque_t));
    if (bloque != NULL){
      bloque->tamanio_bloque = tamanio_de_bloque;
      bloque->data = calloc(1,sizeof(char*) * tamanio_de_bloque);
      bloque->direccion = direccion;
      direccion += mp.cantidad_de_bloques + tamanio_de_bloque;
      bloques[i] = bloque;
    }
  }
}

void inicializar_memoria_principal(){
  mp.capacidad = TAMANIO_MEMORIA_PRINCIPAL;
  int cantidad_de_bloques = TAMANIO_MEMORIA_PRINCIPAL/tamanio_de_bloque;
  mp.cantidad_de_bloques = cantidad_de_bloques;
  mp.bloques = calloc(1,sizeof(bloque_t*) * cantidad_de_bloques);
  inicializar_bloques(mp.bloques,mp.cantidad_de_bloques);
}

void desinicializar_bloques(bloque_t** bloque,int cantidad){
  for (int i = 0; i < cantidad ; i++){
    if (bloque[i] != NULL){
      if (bloque[i]->data != NULL){
        free(bloque[i]->data);
      }
      free(bloque[i]);
    }
  }
  free(bloque);
}

void desinicializar_conjuntos(){
  for (int i = 0; i < cache.cantidad_de_conjuntos; i++){
    for (int k = 0; k < vias_por_conjunto; k++){
      if (cache.conjuntos[i]->bloques[k] != NULL){
        if (cache.conjuntos[i]->bloques[k]->data != NULL){
          free(cache.conjuntos[i]->bloques[k]->data);
        }
        free(cache.conjuntos[i]->bloques[k]);
      }
    }
    free(cache.conjuntos[i]->bloques);
    free(cache.conjuntos[i]->distancia_lru);
    free(cache.conjuntos[i]);
  }
}

void uninit(){
  desinicializar_conjuntos();
  free(cache.conjuntos);
  desinicializar_bloques(mp.bloques,mp.cantidad_de_bloques);
}

conjunto_t** inicializar_conjuntos(int cantidad_de_conjuntos){
  conjunto_t** conjuntos = calloc(1,sizeof(conjunto_t**) * cantidad_de_conjuntos);
  if (conjuntos != NULL){
    for (int i = 0; i < cantidad_de_conjuntos; i++){
        conjuntos[i] = calloc(1,sizeof(conjunto_t));
        conjuntos[i]->bloques = calloc(1,sizeof(bloque_t*) * vias_por_conjunto);
        conjuntos[i]->cantidad_de_bloques = vias_por_conjunto;
        conjuntos[i]->distancia_lru = calloc(1,sizeof(int) * vias_por_conjunto);
        inicializar_bloques(conjuntos[i]->bloques,conjuntos[i]->cantidad_de_bloques);
    }
  }
  return conjuntos;
}

void init(){
  cache.cantidad_de_conjuntos = tamanio_de_cache/vias_por_conjunto;
  cache.conjuntos = inicializar_conjuntos(cache.cantidad_de_conjuntos);
  cache.cantidad_de_misses = 0;
  cache.memoria_ocupada = 0;
  cache.cantidad_de_accesos = 0;
  cache.numero_de_vias = vias_por_conjunto;
  cache.bits_de_index = log(cache.cantidad_de_conjuntos) / log(2);
  cache.bits_de_offset = log(tamanio_de_bloque) / log(2);
  inicializar_memoria_principal();
}
