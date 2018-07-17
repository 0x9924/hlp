#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>
#include <stdint.h>

#include "../ga-print.h"
#include "int-search.h"

#define GEN_SIZE 2
#define NGENERATIONS 4000


int32_t * random_ints (unsigned n_ints);
void ints_print (int32_t* arr, unsigned size);

int32_t fitness_diff (int32_t ind, int32_t o);
int32_t fitness_bits (int32_t ind, int32_t o);

void crossover_generation (int32_t* nueva_gen, int32_t* vieja_gen, unsigned nbits);
int32_t crossover_individual (int32_t p, int32_t q, unsigned nbits) ;

void mutar (int32_t * arreglo, unsigned size);

long partition (int32_t* a, long p, long r, int32_t o, fitness_func foo);
void quicksort_aux(int32_t* a, long p, long r, int32_t o, fitness_func foo) ;
void quicksort(int32_t* a, long len, int32_t o, fitness_func foo) ;


void algo_genetico (int32_t objetivo) {
    int32_t * g0 = random_ints (GEN_SIZE * 2);
    int32_t * g1 = g0 + GEN_SIZE;
    printf("objetivo: \n\t"); prbitsINT32(objetivo);
    printf("\nPrimera Generacio'n\n\t"); ints_print_bin(g0, GEN_SIZE);

    for (int i = 0; i < NGENERATIONS; i++) {
        crossover_generation (g1, g0, GEN_SIZE);
        mutar (g1, GEN_SIZE);
        quicksort(g0, GEN_SIZE * 2, objetivo, fitness_bits);

    }
    printf("numero de generaciones: %d\n", NGENERATIONS);
    printf("resultado:\n\t");
    prbitsINT32(g0[0]); printf(" == %d\n", g0[0]);
    puts("\t======== ======== ======== ========     =============");
    
}

int main (int argc, char ** argv) {
    if (argc < 2) {
        printf("uso: ./%s NUM [NUM ...]\n");
        puts("\tNUM es un numero que se quiere alcanzar.");
        exit(0);
    }
    time_t t;
    srand((unsigned) time(&t));

    for (int i = 1; i < argc; i++) {
        int32_t objetivo = (int32_t) atoi (argv[i]);
        algo_genetico(objetivo);

    }
    
    return 0;
}
