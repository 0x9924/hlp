#include <stdio.h>

unsigned char * random_bytes (unsigned n_bytes);
unsigned * bytes_frecuencias_en_rango (unsigned min, unsigned max,
                                       char * data, long unsigned data_size);
unsigned long random_long ();

long unsigned cantidad = 0xFFFFFFFF;
unsigned data_min = 0;
unsigned data_max = 1;

int main (int argc, char ** argv) {
    printf ("%x\n", random_long());
    return 0;
}
