#include <stdio.h>
#include "random-bytes.h"

long unsigned cantidad = 0xFFFFFFFF;
unsigned data_min = 0;
unsigned data_max = 1;

int main (int argc, char ** argv) {
    printf ("%x\n", rand_in_range_urandom(5));
    return 0;
}
