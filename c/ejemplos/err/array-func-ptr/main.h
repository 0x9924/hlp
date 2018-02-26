extern int global_array[9];
typedef int (*cmp_func_t) (void *, void*);
typedef void (*sum_func_t) (void*, void const *, void const*);

extern cmp_func_t cmp_funcs[9];
