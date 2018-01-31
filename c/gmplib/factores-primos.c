/* Compile with */
/* gcc -o factores factores-primos.c -lgmp -lm */

#include <gmp.h>
#include <stdlib.h>
#include <stdio.h>
void veces_que_divide(mpz_t veces, const mpz_t d,  mpz_t n);

typedef struct potencia_primo {
    mpz_t primo;
    mpz_t potencia;
} *pot_primo;

typedef struct arreglo_primos {
    pot_primo * arr;
    unsigned long capacidad;
    unsigned long largo;
} *arr_pr;


void init_arreglo_primos (arr_pr ap);
void init_potencia_primo(pot_primo pp);
void init_potencia_primo_con(pot_primo pp, mpz_t primo, mpz_t potencia);

int main(int argc, char *argv[])
{
    mpz_t n, primo, veces, cuadrado, mpz_uno;
    mpz_init(n);
    mpz_init_set_ui(primo, 1);
    mpz_init_set_ui(mpz_uno, 1);
    mpz_init(veces);
    mpz_init(cuadrado);

    unsigned long i = 0;
    if ( argc != 2 )
    {					/* not enough words */
        /* printf("Please supply 1 number.\n"); */
        /* return 1; */
        mpz_set_ui (n, 2);
    }
    else     // n es el numero.
      mpz_set_str (n, argv[1], 10);	/* Assume decimal integers */

    gmp_printf ("El numero es %Zd\n", n);


    arr_pr ap = (arr_pr) malloc(sizeof(struct arreglo_primos));
    init_arreglo_primos(ap);

    //pot_primo tmp_p;
    // mientras n != 1
    while (mpz_cmp_ui(n, 1))// && i < 1)
    {
        mpz_add_ui(primo, primo,1);
        gmp_printf("%d\tveces = %Zd, n = %Zd, primo = %Zd (pre)\n",
                   i, veces,  n, primo);

        veces_que_divide(veces, primo, n);
        gmp_printf("%d\tveces = %Zd, n = %Zd, primo = %Zd (post)\n",
                   i, veces,  n, primo);


        
        // pre(n) = n * veces
        if (mpz_cmp_ui(veces, 0)) {// primo divide a pre(n)
            if (i < ap -> capacidad ) {
                (ap -> arr)[i] = malloc (sizeof (pot_primo));
                init_potencia_primo_con((ap -> arr)[i], primo, veces);
            } else {
                fprintf (stderr,
                         "error: falta implementar tantos factores");
                exit(1);
            }
        } else {
            mpz_mul (cuadrado, primo, primo);
            if ( mpz_cmp (cuadrado, n) >= 0 )
            {
                if ( i >= ap -> capacidad ) {
                    fprintf (stderr,
                             "error: falta implementar tantos factores");
                    exit(1);
                }
                (ap -> arr)[i] = malloc (sizeof (pot_primo));
                init_potencia_primo_con((ap -> arr)[i], n, mpz_uno);
                break;
            }
        }
                
        i++;

    }
    gmp_printf("i es %lu\n", i);


    mpz_clear(n);
    mpz_clear(primo);
    mpz_clear(veces);
    mpz_clear(mpz_uno);

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
//    gmp_printf("veces=%Zd, d=%Zd, n=%Zd\n", veces, d, n);
    while (mpz_divisible_p(n, d))
    {
        mpz_add_ui (veces, veces, 1);
        mpz_divexact (n, n, d);
    }
//    gmp_printf ("/El numero es %Zds\n",  n);

}

void init_arreglo_primos (arr_pr ap)
{
    ap -> capacidad = 256;
    ap -> largo = 0;
    ap -> arr = malloc(sizeof(pot_primo) * 256);
}


void init_potencia_primo(pot_primo pp)
{
    mpz_init(pp -> primo);
    mpz_init(pp -> potencia);
}

void init_potencia_primo_con (pot_primo pp, mpz_t primo, mpz_t potencia)
{
    mpz_init(pp -> primo);
    mpz_init(pp -> potencia);
}
