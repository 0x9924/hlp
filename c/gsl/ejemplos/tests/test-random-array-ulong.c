/* compile with: */
/* gcc gsl-hw.c -lm -L/usr/local/lib -lgsl   */


#include <stdio.h>
//#include <gsl/gsl_rng.h>
#include <time.h>

unsigned long * random_array_ulong (unsigned n_bytes, unsigned long max);
unsigned long *
bytes_frecuencias (unsigned char * data, long unsigned data_size,
                   unsigned char max_char) ;

unsigned long sample_size = 5;
unsigned long max = 10;
int main (void)
{
  unsigned long * muestra = random_array_ulong (sample_size, max);
  
  unsigned int i;
  for (i = 0; i < sample_size; i++)
    printf ("%lx, ", muestra[i]);
  puts("");

  
  return 0;
}
