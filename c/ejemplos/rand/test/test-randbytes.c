#include <stdio.h>

unsigned char * random_bytes (unsigned n_bytes);
unsigned * bytes_frecuencias_en_rango (unsigned min, unsigned max,
                                       char * data, long unsigned data_size);

long unsigned cantidad = 0xFFFFFFFF;
unsigned data_min = 0;
unsigned data_max = 1;

int main (int argc, char ** argv) {
    char * randbytes = random_bytes(cantidad);
    unsigned * tabla = bytes_frecuencias_en_rango (data_min, data_max,
                                                   randbytes, cantidad);
    unsigned i;
    for (i = 0; i < data_max - data_min + 1; i++)
        printf("0x%02x\t%d\n", i + data_min, tabla[i]);
    puts("");
    return 0;
}
