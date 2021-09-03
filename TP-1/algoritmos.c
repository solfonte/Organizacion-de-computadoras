#include "algoritmos.h"

unsigned int mcd(unsigned int m, unsigned int n){
  unsigned int temp;
  while(m > 0){
    temp = m; 
    m = n % m;
    n = temp;
  }
  return n;
}

unsigned int mcm(unsigned int m, unsigned int n){
  return (m * n)/mcd(m,n);
}
