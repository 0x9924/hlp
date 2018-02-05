#include "stdio.h"
#include "stdlib.h"
#include "string.h"

#include "tablero.h"
#include "partida.h"
#include "jugada.h"
#include "jugador.h"

#define DIMENSION_TABLERO 3

int main (int argc, char ** argv)
{
    puts("Tateti");

    struct jugador * persona = jugador_nuevo ("la persona", PERS, 0, 'X');

    struct jugador * compu = jugador_nuevo ("la compu", COMP, 1, 'O');

    struct jugador ** jdores = malloc (sizeof (struct jugador **) * 2);
    jdores[0] = persona;
    jdores[1] = compu;
    
    struct partida * part = partida_nueva (DIMENSION_TABLERO,jdores, 2);
    //mostrar_tablero (part);

    printf ("primer jugador: %s.\n", part -> jdores[0] -> nombre);
    printf ("segundo jugador: %s.\n", part -> jdores[1] -> nombre);


    jugar (part, compu, 0, 1);
    //    jugar (part, persona, 1, 2);
    jugar (part, compu, 1, 0);

    jugar (part, compu, 1, 1);
    /* jugar (part, persona, 2, 2); */
    /* jugar (part, compu, 1, 1); */

    /* jugar (part, compu, 2, 0); */

    /* mostrar_tablero (part); */
    /* mostrar_jugadas (part); */
    
    puts ("END");
    return 0;
}

  
