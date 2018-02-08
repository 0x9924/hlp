#include <stdio.h>


double mind(double a, double b) {
     return a < b ? a : b;
}


int mini(int a, int b) {
     return a < b ? a : b;
}


void print_int(int i) { printf("min: %d\n", i); }
void print_double(double d) { printf("min: %f\n", d); }
void print_default(int x) { printf("min: %x\n", x); }

#define min(A, B)                                            \
_Generic ((A)+(B),                                           \
          double: mind,                                      \
          int: mini,                                         \
default: mind)((A), (B))

#define print(X)                                 \
_Generic ((X),                                   \
          int: print_int,                        \
          double: print_double,                  \
default: print_default)((X))
     
int main () {
     print(min(22,33));

     return 0;
}
          
