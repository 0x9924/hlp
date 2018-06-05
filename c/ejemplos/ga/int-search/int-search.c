#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>

#include "../ga-print.h"

#define GEN_SIZE 2
#define NGENERATIONS 8

int objetivo;

int * random_ints (unsigned n_ints);
void quicksort(int* a, long len);
void ints_print (int* arr, unsigned size);

int fitness (int ind) {
     int diff = ind - objetivo;
     int ret = diff < 0 ? -diff : diff;
     //printf("fit: %d\n", ret);
     return ret;
}

int crossover_individual (int p0, int p1, unsigned nbits) {

    unsigned p = p0; unsigned q = p1;
    if (rand() % 2 == 0) { int  tmp = p; p = q; q = tmp; }
    unsigned punto = rand() % (nbits + 1);
    if (punto == 0)
        return p;
    else if (punto = nbits)
        return q;
    else {
        p = (p >> punto) << punto;
        q = (q << (nbits - punto) >> punto);
        return p | q;
    }
}


void crossover_generation (int* nueva_gen, int* vieja_gen, unsigned nbits) {
    for (int i = 0; i < GEN_SIZE / 2; i = i + 2) {
        nueva_gen[i] = crossover_individual (vieja_gen[i],
                                             vieja_gen[i + 1], nbits);
        nueva_gen[i + 1] = crossover_individual (vieja_gen[i],
                                                 vieja_gen[i+1], nbits);
    }
}

long partition (int* a, long p, long r){
     int x = a[r];
     long i = p - 1;
     for (long j = p; j < r; j++) {
          if (fitness(a[j]) <= fitness(x)) {
               i++;
               int tmp = a[i];
               a[i] = a[j];
               a[j] = tmp;
          }
     }
     int tmp = a[i + 1];
     a[i + 1] = a[r];
     a[r] = tmp;
     return i + 1;
}

void quicksort_aux(int* a, long p, long r) {

     if ( p < r ) {
          long q = partition (a, p, r);
          quicksort_aux(a, p, q - 1);
          quicksort_aux(a, q + 1, r);
     }
}


void quicksort(int* a, long len) {
     quicksort_aux(a, 0, len - 1);
}

void mutar (int * arreglo, unsigned size, unsigned nbits) {
     for (int i = 0; i < size ; i++) {
          unsigned bit  = 1 << (rand () % nbits);
          unsigned inverse = ~bit;
          bit &= ~(arreglo[i]);
          arreglo[i] &= inverse;
          arreglo[i] |= bit;
     }
};


int main (int argc, char ** argv) {
    time_t t;
    srand((unsigned) time(&t));
    unsigned nbits = sizeof(int) * 4;
    unsigned bits_in_int = sizeof(int) * 4;


    
    int * g0 = random_ints (GEN_SIZE * 2);
    int * g1 = g0 + GEN_SIZE;

    puts("g0");
    ints_print(g0, GEN_SIZE);
    prbitsINT(g0[0]);
    objetivo = 0;
    for (int i = 0; i < NGENERATIONS; i++) {
        crossover_generation (g0, g1, nbits);
        quicksort(g0, GEN_SIZE * 2);
        mutar (g1, GEN_SIZE, nbits);
        printf("g%d\n", i+ 1);
        ints_print(g0, GEN_SIZE * 2);
    }
    

    //printf("int max: %x\n", (unsigned) INT_MAX);
    
    return 0;
}
