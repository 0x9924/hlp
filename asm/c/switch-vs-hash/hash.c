#include <stdio.h>
#include "switch-vs-hash.h"
#include <stdlib.h>
#include <time.h>

void (*sum_funcs[14]) (void*, void const *, void const *) = {
     sum_floats, sum_floats, sum_floats, sum_floats,
     sum_floats, sum_floats, sum_floats, sum_floats,
     sum_floats, sum_floats, sum_floats, sum_floats,
     sum_floats, sum_floats
};


void sum_g(int x, void *res, void const *a, void const *b) {
     (*sum_funcs[x]) (res, a, b);
}

const int veces = 9999999;

int foo () {
     int x = rand() % 14;
     float a = 9.0f;
     float b = 12.01f;
     void * r;
     sum_g(x, &r, &a, &b); 
     return 0;
}

int main () {

     srand((unsigned) time(0));
     for (int i = 0; i < veces; i++)
          foo();
}
