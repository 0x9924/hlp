#ifndef _PARTIDA_H
#define _PARTIDA_H


#include "jugador.h"
#include "jugada.h"
#include "lista.h"


struct partida {
    struct tablero * tab;
    struct jugador ** jdores;
    unsigned n_jdores;
    struct lista *jdas;
    struct lista * jaques;
};

struct jaque {
    struct jugador * jdor;
    struct celda * celda;
};

void mostrar_tablero (struct partida *p);
struct partida *
partida_nueva (unsigned dim_tablero,
               struct jugador ** jdores, unsigned n_jdores);

void jugar (struct partida *p, struct jugador *jdor,
                     unsigned fila, unsigned col) ;
void mostrar_jugadas (struct partida *p);


#endif
