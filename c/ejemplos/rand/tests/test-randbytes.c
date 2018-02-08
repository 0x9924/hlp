#include <stdio.h>
#include "print-bytes.h"
#include "random-bytes.h"

size_t cantidad = 0xFFFFFF;

const unsigned data_max = 0xF;

int main (int argc, char ** argv) {
    unsigned i;
    printf("Cantidad pedida : %lu\n\n", cantidad);
    puts("X\tfrecuencia");
    unsigned char * randbytes = random_bytes(cantidad);
    uint64_t * tabla = bytes_frecuencias_en_rango (data_max + 1,
                                                   randbytes, cantidad);
    print_table_bytes (data_max + 1, tabla);
    return 0;
}
