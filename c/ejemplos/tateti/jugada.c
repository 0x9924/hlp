#include "jugada.h"

void agregar_jugada (struct lista *j, struct jugador *jdor,
                     unsigned fila, unsigned col) 
{

    struct jugada * jda = malloc (sizeof (struct jugada));
    jda -> jdor = jdor;

    jda -> celda =  malloc (sizeof (struct celda));
    jda -> celda -> fila = fila;
    jda -> celda -> col = col;

    struct nodo *n = malloc (sizeof (struct nodo));
    n -> next = 0x0;
    n -> data = jda;
    if (j -> len > 0) {
        j-> ult -> next = n;
        j -> ult = n;
    } else {
        j -> ult = n;
        j -> prim = n;
    }
    j -> len++;
}
