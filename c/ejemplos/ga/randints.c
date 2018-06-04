#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int * random_ints (unsigned n_ints) {
    FILE * urand = fopen("/dev/urandom", "r");
    unsigned n_bytes = n_ints * sizeof(int);
    //unsigned char byte;
    unsigned char * random_bytes = malloc (sizeof (char) * n_bytes);
    if (n_bytes != fread (random_bytes, 1, n_bytes, urand)) {
        fprintf(stderr, "Error leyendo /dev/urandom"); exit(1);
    }
    fclose(urand);
    return (int*) random_bytes;
}
