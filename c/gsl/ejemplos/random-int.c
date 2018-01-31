/* compile with: */
/* gcc gsl-hw.c -lm -L/usr/local/lib -lgsl   */


#include <stdio.h>
#include <gsl/gsl_rng.h>
#include <time.h>

int
main (void)
{
  
  gsl_rng * r = gsl_rng_alloc (gsl_rng_taus);
  gsl_rng_set (r, time(0x0));
  long int random_int = gsl_rng_uniform_int(r, 5);
  printf ("%x\n", random_int);
  return 0;
}
