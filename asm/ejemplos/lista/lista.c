#include "lista.h"

void agregar_c (lista * l, long i);
void print_list (lista * l);
lista * nueva_lista ();
extern long enesimo (lista *, long);

int main (int argc, char ** argv)
{
    if (argc == 1)
        return 0;
    long n = atol(argv[1]);
    lista *l = nueva_lista();

    agregar_c (l, 0xffL);
    
    long i;
    for (i = 8; i < 21; i++) 
        agregar_c (l, i);

    print_list (l);
    printf ("\nenesimo (l, %ld) : %ld\n", n, enesimo (l, n));
    
    return 0;
}

void agregar_c (lista * l, long i) {
    nodo * nuevo = malloc (sizeof(nodo));
    nuevo -> dato = i;
    nuevo -> prox = 0x0;
    nodo * n = l -> primero;
    if (!n) {
        l -> primero = nuevo;
    }
    else {
        while (n -> prox) {
            n = n -> prox;
        }
        n -> prox = nuevo;
    }
}

void print_list (lista * l) {
    nodo * n = l -> primero;
    long c = 0;
    while (n) {
        printf("c: %ld = %ld\n", c++, n -> dato);
        n = n -> prox;
    }
}

lista * nueva_lista () {
    lista *res = malloc (sizeof(lista));
    res -> primero = 0x0;
    return res;
}
