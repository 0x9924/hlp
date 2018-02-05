#ifndef NODO1_H
#define NODO1_H

#include <stdlib.h>
#include <stdio.h>

struct nodo {
    int condicion;
    struct nodo * sgt;
};


struct nodo * nodo_nuevo (int cond);
struct nodo * lista_zigzag ();
void reordenar (struct nodo * t,
                struct nodo ** cl_p, struct nodo ** nocl_p);
void nodo_print (struct nodo * n);

#endif
