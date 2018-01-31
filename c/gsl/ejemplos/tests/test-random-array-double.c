#include <stdio.h>
#include <stdlib.h>
/* El resultado depende del seed.
   para setear:
   
   GSL_RNG_SEED=123 GSL_RNG_TYPE=mrg ./a.out
*/
double * random_array_double (unsigned size) ;
void print_help ();

unsigned size;
int
main (int argc, char **argv)
{
  print_help();
  if (argc != 2) {
    puts("Debe indicarse una cantidad."); exit(0);
  }
  size = atol(argv[1]);
  
  double * array = random_array_double (size);
  int i;
  for (i = 0; i < size; i++)
    printf ("%.5f\n", array[i]);
  return 0;
}
