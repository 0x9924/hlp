#include <stdlib.h>
#include <stdint.h>

#ifndef NBITS
#define NBITS 32
#endif
void mutar (int32_t * arreglo, unsigned size) {
     for (int i = 0; i < size ; i++) {
          unsigned bit  = 1 << (rand () % NBITS);
          unsigned inverse = ~bit;
          bit &= ~(arreglo[i]);
          arreglo[i] &= inverse;
          arreglo[i] |= bit;
     }
};
