#include "main.h"

int cmp_int (void * a, void * b) { return 0; };
int cmp_float (void * a, void * b) { return 0; };

/* void sum_int (void * dest, void const * a, void const * b) { return; }; */
/* voido sum_float (void * dest, void const * a, void const * b) { return; }; */

/* cmp_func_t func_array[2]; */
/* func_array[0] = cmp_int; */

int global_array[9];
cmp_func_t cmp_funcs[9];
     global_array[0] = 0;

int main () {
     global_array[0] = 0;
     return 0;
}
