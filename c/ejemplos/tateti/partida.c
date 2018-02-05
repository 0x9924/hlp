#include "partida.h"
#include <assert.h>
#include "tablero.h"


struct partida *
partida_nueva (unsigned dim_tablero,
               struct jugador ** jdores, unsigned n_jdores)
{
    struct partida * p = malloc (sizeof(struct partida));

    p -> tab = tablero_nuevo (dim_tablero);
    p -> jdores = jdores;
    p -> n_jdores = n_jdores;
    

    struct lista *js = malloc (sizeof (struct lista));
    js -> prim = js -> ult = 0x0;
    js -> len = 0;
    p -> jdas  = js;
    return p;
}


void mostrar_tablero (struct partida *p)
{
    tablero_mostrar (p -> tab);
}



void jugar (struct partida *p, struct jugador *jdor,
                     unsigned fila, unsigned col) 

{
    assert (fila < p -> tab -> dim && col  < p -> tab -> dim);
    agregar_jugada (p -> jdas, jdor, fila, col);
    p -> tab -> celdas [fila][col] = jdor -> simbolo;
    struct lista * l =
        jugada_es_jaque (p -> tab, fila, col, jdor) ;
    
    if ( l -> len) {
      printf ("la jugada es %d jaque(s)", l -> len);
	mostrar_tablero (p);
	struct nodo * n = l -> prim;
	while (n) {
	  struct jaque * jq = n -> data;
	  printf("celda libre: (%d, %d)\n",
                 jq -> celda -> fila,
                 jq -> celda -> col);
	  n = n -> next;
	}

    }
    else
	puts ("no es jaque");
}

void mostrar_jugadas (struct partida *p)
{
    struct nodo *n;
    unsigned i = 0;
    printf ("Hubo %d jugadas.\n", p -> jdas -> len);
    for (n = p -> jdas -> prim; n ; n = n -> next) {
        struct jugada *j = n -> data;
        printf ("i: %d. Jugador: \"%s\"\t (%c). fila: %d, columna %d.\n",
                i++,
                j -> jdor -> nombre,
                j -> jdor -> simbolo,
                j -> celda -> fila,
                j -> celda ->  col);
    }

}
