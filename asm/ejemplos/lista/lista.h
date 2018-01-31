#include <stdio.h>
#include <stdlib.h>

typedef struct nodo_t {
    long dato;
    struct nodo_t *prox;
} nodo;

typedef struct lista_t {
    nodo *primero;
} lista;
