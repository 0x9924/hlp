#include <stdio.h>
#include <stdlib.h>
#include "../../../../c/ejemplos/rand/random-bytes.h"

#define N_INTS 4 * 4
#define N_BYTES N_INTS * 2

typedef struct {
     unsigned c : 13;
     unsigned b : 10;
     int a : 9;
}__attribute__((packed)) mist;

extern void suma_mist (mist * mists, int tam, unsigned *res);

int main() {
     char * rand_bytes = random_bytes(N_BYTES * 4);
     unsigned  * rand_uints = (unsigned *) rand_bytes;
     unsigned *res = malloc (N_BYTES);
     mist * m = (mist *) rand_bytes;

     for (int i = 0; i < N_INTS; i++) {
          printf("%8x\t", rand_uints[i]);
          unsigned a = 0x1ff & (unsigned) m[i].a;
          unsigned b = m[i].b;
          unsigned c = m[i].c;
          unsigned suma = a + b + c;
          printf ("m.a: %8x\t"
                  "|m.a|: %4x\t"
                  "m.b: %4x\t"
                  "m.c: %4x\t"
                  "|a|+c+b: %8x"
                  "\n", m[i].a, a, b, c, suma);
                  
     }
     suma_mist(m, N_INTS, res);
     for (int i = 0; i < N_INTS; i++)
          printf("%x\n", res[i]);
}

