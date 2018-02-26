#include "switch-vs-hash.h"

void sum_ints(void *res, void const *a, void const *b) {
     *((int*)res) = *(int*)a + *(int*)b;
     return;
}
void sum_floats(void *res, void const *a, void const *b) {
     *((float*)res) = *(float*)a + *(float*)b;
     return;
};
void sum_strings(void *res, void const *a, void const *b) {
     char * tmp = strcat (*(char**)a, *(char**)b);
     *(char **)res = tmp;
     return;
};
