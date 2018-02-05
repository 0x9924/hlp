#include "jugador.h"

struct jugador *
jugador_nuevo (char * nombre, tipo_jdor tipo, unsigned numero,
               char simbolo)
{
    struct jugador * j = malloc (sizeof (struct jugador));
    j -> nombre = strdup(nombre);
    j -> tipo = tipo;
    j -> numero = numero;
    j -> simbolo = simbolo;
    return j;
    
}
