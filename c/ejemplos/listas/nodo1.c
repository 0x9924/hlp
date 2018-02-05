#include "nodo1.h"

struct nodo * nodo_nuevo (int cond) {
    struct nodo * res = malloc (sizeof (struct nodo *));
    if (!res) {
        //fprintf (stderr, "Fallo malloc. Chau,\n");
        exit (1);
    }
    res -> sgt = 0x0;
    res -> condicion = cond;
}

void reordenar (struct nodo * t,
                struct nodo ** cl_p, struct nodo ** nocl_p)
{
    struct nodo * cl, * nc, * tmp;
    cl = nc = 0x0;
    while (t) {
        if ( t -> condicion ) {
            if ( cl ) {
                cl -> sgt = t;
            } else { // primero con condicion
                *cl_p = t;
            }
            cl = t;
        } else {
            if ( nc ) { // !condicion
                nc -> sgt = t;
            } else {
                nc = t;
                *nocl_p = t;
            }
            nc = t;
        }
        tmp = t;
        t = t -> sgt;
        tmp -> sgt = 0x0;
    }
}


void nodo_print (struct nodo * n) {
    int i;
    i = 0;
    while ( n ) {
        printf ("\tnodo %d. cond == %s\n",
                i, n -> condicion ? "true" : "false");
        n = n -> sgt; i++;
    }
}

struct nodo * lista_zigzag () {
    int i;
    struct nodo * nueva_lista = nodo_nuevo(1);
    struct nodo * lp = nueva_lista;
    for (i = 0; i < 20; i++) {
#ifdef DEBUG
        printf ("nodo %d, cond:  %d\n", i, i%2);
#endif
        lp -> sgt = nodo_nuevo( i % 2 );
        lp = lp -> sgt;
    }
    return nueva_lista;
}
