#include <string.h>

typedef  void (*sum_func_t) (void*, void const *, void const *); 

void sum_ints(void *res, void const *a, void const *b);
void sum_floats(void *res, void const *a, void const *b);
void sum_strings(void *res, void const *a, void const *b);
