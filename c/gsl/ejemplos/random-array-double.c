#include <gsl/gsl_rng.h>
#include <stdio.h>
#include <stdlib.h>

unsigned size;

double * random_array_double (unsigned size) {
  double * array = malloc (sizeof(double) * size);
  const gsl_rng_type * T;
  gsl_rng * r;

  gsl_rng_env_setup();

  T = gsl_rng_default;
  r = gsl_rng_alloc (T);

  int i;
  for (i = 0; i < size; i++)
    {
      double u = gsl_rng_uniform (r);
      array[i] = u;
    }

  gsl_rng_free (r);
  return array;
}
                           
void print_help () {
  puts ("El resultado depende del seed.\n"
        "para setear:\n"
        "GSL_RNG_SEED=123 GSL_RNG_TYPE=mrg ./a.out");
}
