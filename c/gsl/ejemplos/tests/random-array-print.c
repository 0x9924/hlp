/* compile with: */
/* gcc gsl-hw.c -lm -L/usr/local/lib -lgsl   */


#include <stdio.h>
//#include <gsl/gsl_rng.h>
#include <time.h>

unsigned char * random_bytes (unsigned n_bytes, unsigned char max);
unsigned long *
bytes_frecuencias (unsigned char * data, long unsigned data_size,
                   unsigned char max_char) ;

unsigned long sample_size = 0x200;
unsigned char max_char = 10;
int main (void)
{
  unsigned char * muestra = random_bytes (sample_size, max_char);
  unsigned long * tabla =  bytes_frecuencias(muestra, sample_size, max_char);
  
  unsigned int i;
  /* for (i = 0; i < sample_size; i++) */
  /*   printf ("%d, ",muestra[i]); */
  /* puts(""); */

  for (i = 0; i < max_char; i++)
    printf ("tabla[%d] \t%lu\n", i, tabla[i]);

  return 0;
}
