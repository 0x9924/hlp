#ifndef _LISTA_H
#define _LISTA_H

#include <stdlib.h>

struct lista {
    unsigned len;
    struct nodo {
	struct nodo *next;
	struct nodo *prev;
	void * data;
    } *prim, *ult;
};

struct lista* lista_nueva ();

void agregar_al_final (struct lista * l, void * d);


#endif
    
