#include <stdio.h>
#include <stdlib.h>
#include "../../../../c/ejemplos/rand/random-bytes.h"

#define N_UINTS 16
#define N_BYTES N_UINTS * 4

void clean_upper_bits (unsigned * arr, unsigned len);
void print_matrix (unsigned * m, unsigned nf, unsigned nc) ;

extern void sumatorias (unsigned *, unsigned *);

int main() {
     char * rand_bytes = random_bytes(N_BYTES);
     unsigned * rand_uints = (unsigned *) rand_bytes;
     clean_upper_bits (rand_uints, N_UINTS);
     unsigned * res = malloc (N_BYTES);
     sumatorias (rand_uints, res);

     for (int i = 0; i < 16; i++)
          printf("%d ", rand_uints[i]);
     print_matrix(rand_uints, 4, 4);
     print_matrix(res, 4,4);
}

void clean_upper_bits (unsigned * arr, unsigned len) {
     int i;
     for (i = 0; i < len; i++)
          arr[i] &= 0xf;
}

void print_matrix (unsigned * m, unsigned nf, unsigned nc) {
     int i,j;
     puts("");
     for (i = 0; i < nc; i++) {
          for (j = 0; j < nf; j++ ) 
               printf("%4d ", m[nc * i + j]);
          puts("");
     }
}
