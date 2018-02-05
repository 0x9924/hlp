#include "lista.h"

struct lista* lista_nueva ()
{
    struct lista* l = malloc(sizeof (struct lista));
    l -> len = 0;
    l -> prim = l -> ult = 0x0;
}

void agregar_al_final (struct lista * l, void * d)
{
    struct nodo *n = malloc (sizeof (struct nodo));
    n -> data = d;
    n -> next = 0x0;
    n -> prev = l -> ult;
    if (l -> len == 0) {
	l -> prim = l -> ult = n;
    } else {
	l -> ult -> next = n;
    }
    l -> len++;
}
