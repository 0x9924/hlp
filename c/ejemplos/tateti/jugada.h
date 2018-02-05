#ifndef _JUGADA_H
#define _JUGADA_H

#include "tablero.h"
#include "partida.h"
#include "jugador.h"

struct partida;

struct jugada {
  struct jugador *jdor;
  struct celda *celda;
};

void agregar_jugada (struct lista *j, struct jugador *jdor,
                     unsigned fila, unsigned col) ;


#endif
