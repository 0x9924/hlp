/* Compile with */
/* gcc -o add_example add_example.c -lgmp -lm */

#include <stdio.h>			/* for printf */
#include <gmp.h>

void veces_que_divide(mpz_t veces, const mpz_t d, mpz_t n);


int main(int argc, char *argv[])
{
    mpz_t d, n, resto, veces;
    if ( argc != 3 ) {
      printf("Please supply two numbers.\n"); return 1;
    }

    mpz_init_set_str (d, argv[1], 10);	/* Assume decimal integers */
    mpz_init_set_str (n, argv[2], 10);	/* Assume decimal integers */
    mpz_init (veces);
    
    gmp_printf ("%Zd divide a %Zd: ", d, n);
    veces_que_divide (veces, d, n);
    gmp_printf ("%Zd veces\n", veces);
    
  
    return 0;
}

void veces_que_divide(mpz_t veces, const mpz_t d, mpz_t n)
{
    if (!mpz_cmp_ui(d, 1))
    {
        mpz_set (veces, n);
        mpz_set_ui (n, 1);
        return;
    }
        
    mpz_set_ui(veces, 0);
    while (mpz_divisible_p(n, d))
    {
        mpz_add_ui (veces, veces, 1);
        mpz_divexact (n, n, d);
    }

}
