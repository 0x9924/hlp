#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>
#include <stdint.h>

#include "../ga-print.h"

#define GEN_SIZE 2
#define NGENERATIONS 4000000

int32_t * random_ints (unsigned n_ints);
void quicksort(int32_t* a, long len, int32_t o);
void ints_print (int32_t* arr, unsigned size);

int32_t fitness_diff (int32_t ind, int32_t o);
int32_t fitness_bits (int32_t ind, int32_t o);

void crossover_generation (int32_t* nueva_gen, int32_t* vieja_gen, unsigned nbits);
int32_t crossover_individual (int32_t p, int32_t q, unsigned nbits) ;

void mutar (int32_t * arreglo, unsigned size);

long partition (int32_t* a, long p, long r, int32_t o);
void quicksort_aux(int32_t* a, long p, long r, int32_t o) ;
void quicksort(int32_t* a, long len, int32_t o) ;


int main (int argc, char ** argv) {
    time_t t;
    srand((unsigned) time(&t));

    
    int32_t * g0 = random_ints (GEN_SIZE * 2);
    int32_t * g1 = g0 + GEN_SIZE;


    int32_t objetivo = 0;//0xff0f;

    printf("objetivo: \n\t");
    prbitsINT32(objetivo);
    printf("\nPrimera Generacio'n\n\t");
    ints_print_bin(g0, GEN_SIZE);

    for (int i = 0; i < NGENERATIONS; i++) {
        crossover_generation (g1, g0, GEN_SIZE);
        mutar (g1, GEN_SIZE);
        quicksort(g0, GEN_SIZE * 2, objetivo);

    }
    printf("numero de generaciones: %d");
    printf("resultado:\n\t");
    prbitsINT32(g0[0]);
    puts("");
    
    return 0;
}
