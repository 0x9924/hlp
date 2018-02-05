#ifndef _TABLERO_H
#define _TABLERO_H


#include <stdlib.h>
#include <stdio.h>
#include "lista.h"
#include "jugador.h"

#define C_VACIA ' '

struct tablero {
  char ** celdas;
  unsigned dim;
};

struct celda {
  unsigned fila;
  unsigned col;
};

struct tablero* tablero_nuevo (unsigned dim);
void tablero_mostrar (struct tablero * t);
struct lista *
jugada_es_jaque (struct tablero * t, unsigned fila, unsigned col,
                 struct jugador * jdor);
#endif
