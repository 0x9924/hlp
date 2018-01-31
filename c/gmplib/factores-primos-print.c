/* Compile with */
/* gcc -o factores factores-primos.c -lgmp -lm */

#include <gmp.h>
#include <stdlib.h>
#include <stdio.h>
void veces_que_divide(mpz_t veces, const mpz_t d,  mpz_t n);

int main(int argc, char *argv[])
{
    mpz_t n, primo, veces, cuadrado;
    mpz_init(n);
    mpz_init_set_ui(primo, 1);
    mpz_init(veces);
    mpz_init(cuadrado);

    unsigned long i = 0;
    if ( argc != 2 ) {	
        printf("Please supply 1 number.\n");
        return 1;
    }

    mpz_set_str (n, argv[1], 10);	/* Assume decimal integers */

    //pot_primo tmp_p;
    // mientras n != 1
    while (mpz_cmp_ui(n, 1))// && i < 1)
    {
        mpz_add_ui(primo, primo,1);
        veces_que_divide(veces, primo, n);
        // pre(n) = n * veces
        if (mpz_cmp_ui(veces, 0)) {// primo divide a pre(n)
            gmp_printf ("(%Zd, %Zd) ", primo, veces);
        } else {
            mpz_mul (cuadrado, primo, primo);
            if ( mpz_cmp (cuadrado, n) >= 0 ) {
                gmp_printf ("(%Zd, %d) ", n, 1);
                break;
            }
        }
    }
    puts("");
    mpz_clear(n);
    mpz_clear(primo);
    mpz_clear(veces);

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

