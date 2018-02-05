#ifndef _JUGADOR_H
#define _JUGADOR_H

#include <stdlib.h>
#include <string.h>
typedef enum { COMP, PERS }  tipo_jdor;

struct jugador {
  char * nombre;
  char simbolo;
  tipo_jdor tipo;
  unsigned numero;
};

struct jugador *
jugador_nuevo (char * nombre, tipo_jdor tipo, unsigned numero,
               char simbolo);

#endif
