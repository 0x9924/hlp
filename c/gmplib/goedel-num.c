/* Compile with */
/* gcc -o nprimos n-primos.c -lgmp -lm */

#include <gmp.h>
#include <stdlib.h>
#include <errno.h>
#include <stdio.h>
//void veces_que_divide(mpz_t veces, const mpz_t d,  mpz_t n);

struct primos {
    mpz_t num;
    struct primos * next;
};

int es_divisible_por_alguno (mpz_t n, struct primos * pms);
struct primos * agregar_al_final (struct primos * pms, mpz_t n);
void primos_init_ui (struct primos ** pms, unsigned long long ui);
void print_num_list(struct primos * nums) ;
mpz_t * read_nums (unsigned n, char ** v);
struct primos * nprimos_list (unsigned n);


int main(int argc, char *argv[])
{
    if ( argc < 2 ) { puts("Uso: goedel [NUMERO NUMERO ...]"); return 1; }

    mpz_t * nums = read_nums (argc -1, argv + 1);
    struct primos * ps = nprimos_list (argc -1);
    print_num_list(ps);

    return 0;
}

int es_divisible_por_alguno (mpz_t n, struct primos * primos)
{
    int ret = 0;
    struct primos * p = primos;
    mpz_t cuad;
    mpz_init_set_ui (cuad, 4);
    while (p && mpz_cmp (cuad, n) <= 0)
    {
        if (mpz_divisible_p (n, p -> num)) {
            ret = 1;
            break;
        }
        p = p -> next;
        mpz_mul (cuad, p -> num, p -> num);
    }
    mpz_clear(cuad);
    return ret;
}

struct primos * agregar_al_final (struct primos * pms, mpz_t n)
{
    while (pms -> next) { pms = pms -> next; }
    struct primos * nuevo = malloc (sizeof (struct primos));
    if (!nuevo) { puts("No mas memotia");exit (1); }
    mpz_init_set (nuevo -> num, n);
    nuevo -> next = 0x0;
    pms -> next = nuevo;
    return nuevo;
}

void primos_init_ui (struct primos ** pms, unsigned long long ui)
{
    struct primos * nuevo;
    nuevo = (struct primos *) malloc (sizeof (struct primos));
    mpz_t n;
    mpz_init_set_ui (nuevo -> num, ui);
    nuevo -> next = 0x0;
    *pms = nuevo;
}

void print_num_list(struct primos * nums) {
    unsigned i = 0;
    while  (nums) {
        gmp_printf ("%d: %Zd\n", i++, nums -> num);
        nums = nums -> next;
    }
}

mpz_t * read_nums (unsigned n, char ** v) {
    unsigned i;
    mpz_t * numeros = malloc (sizeof(mpz_t)*n);
    for (i = 0; i < n; i++) {
        mpz_init_set_str (numeros[i], v[i], 10);
    }
    return numeros;
}

void list_to_goedel (mpz_t g, struct primos * nums, mpz_t * exps) {
    mpz_init_set_ui(i, 1);
    while  (nums) {
        mpz_pow_ui (nums -> num, // todo
        nums = nums -> next;
    }
}

struct primos * nprimos_list (unsigned n) {
    struct primos * pms, * qms, * ult;
    mpz_t /* n,*/ i;

    primos_init_ui (&pms, 2);
    ult = pms;
    mpz_init_set_ui(i, 3);
    unsigned long long j = 1;
    while (j < n)
    {
	if (!es_divisible_por_alguno (i, pms)) {
	    ult = agregar_al_final (ult, i);
	}	
	j++;
	mpz_add_ui (i, i, 2);
    }
    return pms;
}
