#include <stdint.h>
#include "int-search.h"

int32_t fitness_bits (int32_t ind, int32_t o);

long partition (int32_t* a, long p, long r, int32_t o, fitness_func foo){
     int32_t x = a[r];
     long i = p - 1;
     for (long j = p; j < r; j++) {
         if (foo(a[j], o) > foo(x, o)) {
               i++;
               int32_t tmp = a[i];
               a[i] = a[j];
               a[j] = tmp;
          }
     }
     int32_t tmp = a[i + 1];
     a[i + 1] = a[r];
     a[r] = tmp;
     return i + 1;
}

void quicksort_aux(int32_t* a, long p, long r, int32_t o, fitness_func foo) {

     if ( p < r ) {
          long q = partition (a, p, r, o, foo);
          quicksort_aux(a, p, q - 1, o, foo);
          quicksort_aux(a, q + 1, r, o, foo);
     }
}


void quicksort(int32_t* a, long len, int32_t o, fitness_func foo) {
     quicksort_aux(a, 0, len - 1, o, foo);
}
