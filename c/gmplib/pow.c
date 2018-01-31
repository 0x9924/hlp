/* Compile with */
/* gcc -o pow pow.c -lgmp -lm */

#include <gmp.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

int main(int argc, char *argv[])
{

    if (argc != 3)
    {
        printf("prog NUM NUM\n");
        return 1;
    }
    
    char * tail;
    unsigned long long potencia;
    errno = 0;
    mpz_t base;
    
    potencia = strtoul (argv[2], &tail, 10);
    if (errno) { puts("potencia demasiado grande"); return 0; }

    
    mpz_init_set_str (base, argv[1], 10);

    mpz_pow_ui (base, base, potencia);

    gmp_printf ("%Zd\n", base);

    return 0;
}
