/* Compile with */
/* gcc -o es-primo es-primo.c -lgmp -lm */

#include <gmp.h>
//#include <stdlib.h>
#include <stdio.h>


int main(int argc, char *argv[])
{
  if ( argc != 2 ) { puts("Uso: primos-hasta NUMERO"); return 1; }
    
    mpz_t n, i;
    mpz_init_set_str (n, argv[1], 10);
    int test = mpz_probab_prime_p (n, 50);
    switch ( test ) {
    case 0:
      puts ("no es primo");
      break;
    case 1:
      puts ("es probablemente primo");
      break;
    case 2:
      puts ("es primo");
      break;
    }
    mpz_clear(n);
    return 0;
}
     
