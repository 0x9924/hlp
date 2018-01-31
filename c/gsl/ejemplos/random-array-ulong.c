#include <gsl/gsl_rng.h>
#include <time.h>
#include <stdio.h>

unsigned long * random_array_ulong (unsigned n_bytes,
                                     unsigned long range_size) {
    unsigned long * array = malloc (sizeof (char) * n_bytes);
    const gsl_rng_type * T;
    gsl_rng * r;

    gsl_rng_env_setup();

    T = gsl_rng_default; // Generator setup
    r = gsl_rng_alloc (T);

    
    unsigned i; 
    for (i = 0; i < n_bytes; i++) {
        unsigned long rnum = gsl_rng_uniform_int(r, range_size);
        array[i] =  rnum; 
    }

    gsl_rng_free(r);
    return array;
}

unsigned long *
bytes_frecuencias (unsigned char * data, long unsigned data_size,
                   unsigned char max_char) {
    
    unsigned long * tabla = malloc (sizeof(unsigned) * max_char);
    int i;
    for (i = 0; i < max_char; i++) { tabla[i] = 0; }
    /* for (i = 0; i < data_size; i++) { */
    /*     unsigned num = data[i];  */
    /*     tabla[num] ++; */
    /* } */
    return tabla;
}

/* unsigned long * */
/* bytes_frecuencias (unsigned char * data, long unsigned data_size, */
/*                    unsigned char max_char) { */
    
/*     unsigned long * tabla = malloc (sizeof(unsigned) * max_char + 1); */
/*     int i; */
/*     for (i = 0; i < max_char + 1; i++) { tabla[i] = 0; } */
/*     /\* for (i = 0; i < data_size; i++) { *\/ */
/*     /\*     tabla[data[i]] ++; *\/ */
/*     /\* } *\/ */
/*     return tabla; */
/* } */

