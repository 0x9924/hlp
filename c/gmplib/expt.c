/* Compile with */
/* gcc -o add_example add_example.c -lgmp -lm */

#include <stdio.h>			/* for printf */
#include <stdlib.h>
#include <gmp.h>
 
int main(int argc, char *argv[])
{
  mpz_t a, res;                 		/* working numbers */
  unsigned long long b;
  if ( argc != 3)
  {					/* not enough words */
    printf("Please supply two numbers.\n");
    return 1;
  }
  mpz_init_set_str (a, argv[1], 10);	/* Assume decimal integers */
  b = atoll (argv[2]);
  mpz_init (res);

  mpz_pow_ui (res, a, b);

  printf ("%s\n", mpz_get_str (NULL, 10, res));
  
  return 0;
}
