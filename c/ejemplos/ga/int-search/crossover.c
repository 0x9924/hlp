#include <stdint.h>
#include <stdlib.h>

#include "int-search.h"


int32_t crossover_individual (int32_t p, int32_t q) {
    if (rand() % 2 == 0) { int32_t  tmp = p; p = q; q = tmp; }
    unsigned punto = rand() % (NBITS + 1);

    int32_t res;
    int32_t pmask, qmask;

    if (punto == 0)
        res =  p;
    else if (punto == NBITS)
        res = q;
    else {
        pmask = (1 << punto) - 1;
        qmask = ~pmask;
        p &= pmask;
        q &= qmask;
        res = p | q;
    }

    return res;
}


void crossover_generation (int32_t* nueva_gen, int32_t* vieja_gen,
                           unsigned gen_size) {
    for (int i = 0; i < gen_size / 2; i = i + 2) {
        int32_t p, q;
        p = vieja_gen[i]; q = vieja_gen[i + 1];
        nueva_gen[i] = crossover_individual (p, q);
        nueva_gen[i + 1] = crossover_individual (p, q);
    }
}
