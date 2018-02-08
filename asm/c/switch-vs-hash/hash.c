#include <stdio.h>
#include "switch-vs-hash.h"

void (*sum_funcs[3]) (void*, void const *, void const *) = {
     sum_ints, sum_floats, sum_strings
};


void sum_g(int x, void *res, void const *a, void const *b) {
     (*sum_funcs[x]) (res, a, b);
}


int main () {
     int x = 0;
     int a = 9;
     int b = 12;
     void * r;
     sum_g(x, &r, &a, &b); 
     return 0;
}
