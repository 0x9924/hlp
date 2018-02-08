#include <stdio.h>
#include "random-bytes.h"
#include "print-bytes.h"
#include <stdlib.h>
#include <getopt.h>

long unsigned cantidad = 0xFF;

unsigned n;

int main (int argc, char ** argv) {
    char c;
   
    while ((c = getopt (argc, argv, "c:")) != -1)
     {
      switch (c)
      {
	 case 'c':
             cantidad = atoll(optarg);
             //printf("argumento dado a la opci'on: %s\n", optarg);
	    break;
	 /* case 'd': */
	 /*    printf("caso \'d\'\n"); */
	 /*    printf("argumento dado a la opci'on: %s\n", optarg); */
	 /*    return 0; */
	 case '?':
	    if (isprint (optopt))
	    {
	       fprintf (stderr, "Opcion desconocida `-%c'.\n", optopt);
	    }
	    else
	       fprintf (stderr,
			"Caracter de opcion desconocido `\\x%x'.\n",
			optopt);
	    return 1;
	 default:
	    abort ();
      }
   }
    if (optind == optarg) {
        puts("indicar n"), exit(0);
    }
    n = atoi(argv[optind]);
    printf ("cantidad:\t %d\nmax: %d == 0x%x\n", cantidad, n, n);
    unsigned i;
    uint64_t * arr = rand_ints_in_range_urandom (n, cantidad);

    puts("");
    uint64_t * tabla = int64_frecuencias_en_rango(n, arr, cantidad);
    print_table_uint64(n, tabla);
    unsigned long suma = 0;
    for (i = 0; i < n; i++)
      suma += tabla[i];

    printf("%ld\n", suma);
    return 0;
}
