#include <gsl/gsl_rng.h>
#include <time.h>
#include <stdio.h>

unsigned char * random_bytes (unsigned n_bytes, unsigned char range_size) {
    gsl_rng * r;
        
    const gsl_rng_type * T;
    gsl_rng_env_setup();
    T = gsl_rng_default; // Generator setup
    r = gsl_rng_alloc (T);

    /* unsigned long seed = time(0x0); */
    /* if (seed < range_size || ) { */
    /*     fprintf (stderr, "seed malo\n"); exit (1); */
    /* } */
    //gsl_rng_set (r, seed);
    /* gsl_rng * r = gsl_rng_alloc (gsl_rng_taus); */
    
    unsigned char * random_bytes = malloc (sizeof (char) * n_bytes);
    unsigned i; 
    for (i = 0; i < n_bytes; i++) {
        unsigned long rnum = gsl_rng_uniform_int(r, range_size);
        if (rnum > range_size) {
            fprintf (stderr, "mando fruta\n"); exit (1);
        }
        random_bytes[i] = (unsigned char) rnum; 
        //printf ("random_bytes[%d] = %d\n", i, random_bytes[i] );
    }

    /* for (i = 0; i < n_bytes ; i++) */
    /*     printf ("%d, ", i, random_bytes[i] ); */
    puts("");
    gsl_rng_free(r);
    return random_bytes;
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

