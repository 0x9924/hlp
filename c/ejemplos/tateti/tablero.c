#include "tablero.h"
#include "lista.h"
#include "partida.h"

struct tablero* tablero_nuevo (unsigned dim)
{
    unsigned i,j;
    struct tablero *t = malloc (sizeof (struct tablero));
    t -> dim = dim;
    t -> celdas = malloc (sizeof (char *) * dim);
    for (i = 0; i < dim; i ++)
        t -> celdas [i] = malloc (sizeof(char) * dim);

    for (i = 0; i < dim; i++)
        for (j = 0; j< dim; j++)
            t -> celdas [i][j] = C_VACIA;
    return t;
}

void tablero_mostrar (struct tablero * t)
{
  unsigned f,c,i;
    char * linea = "----------";
    char * esps =  "    "; 
    printf("\n\t\t");
    for (i = 0; i < t -> dim ; i++)
      printf("%s", linea);

    for (f = 0; f < t -> dim; f++) {
      printf("\n\t\t ");
      for (i = 0; i < t -> dim -1 ; i++)
        printf("%s %s|",esps, esps);
        for (c = 0; c < t -> dim; c++) {
            if (c)
                printf ("|%s%c%s",esps, t -> celdas [f][c], esps);
            else
                printf( "\n\t\t %s%c%s",
                        esps, t -> celdas [f][c], esps );
        }
        printf("\n\t\t ");
        for (i = 0; i < t -> dim -1 ; i++) printf("%s %s|",esps, esps);
        printf("\n\t\t");      
        for (i = 0; i < t -> dim ; i++) printf("%s", linea);

    }
    puts("");
}


void tablero_mostrar__ (struct tablero * t)
{
    unsigned i,j;
    for (i = 0; i < t -> dim; i++) {
        puts("");
        for (j = 0; j < t -> dim; j++)
            printf( "celda [%d][%d] %c\t",
                    i,j,
                    t -> celdas [i][j] );
    }
    puts("");
}

struct lista *
jugada_es_jaque
(struct tablero * t, unsigned fila, unsigned col, struct jugador * jdor)
{
    int i, nsimb, nvacia, notro; i = nsimb = nvacia = notro = 0;
    char c;
    struct lista *res = lista_nueva();
    struct celda *celda = malloc (sizeof (struct celda));
    /* me fijo la fila */
    while (i < t -> dim && notro == 0 && nvacia <= 1) {
	c = t -> celdas [fila] [i];
	if ( c == C_VACIA ) {
	    nvacia++;
	    celda -> fila = fila;
	    celda -> col = i;
	}
	else if ( c == jdor -> simbolo )
	    nsimb++;
	else
	    notro++;
	i++;
    }
    if (nvacia == 1 && notro == 0 && nsimb == t -> dim - 1) {
        struct jaque * jq = malloc (sizeof (struct jaque));
        jq -> jdor = jdor;
        jq -> celda = celda;
	agregar_al_final (res, jq);
	celda = malloc (sizeof (struct celda));
    }
    /* me fijo la columna */
    nvacia = notro = nsimb = 0;
    while (i < t -> dim && notro == 0 && nvacia <= 1) {
	c = t -> celdas [i] [col];
	if ( c == C_VACIA ) {
	    nvacia++;
	    celda -> fila = i;
	    celda -> col = col;
	}
	else if ( c == jdor -> simbolo )
	    nsimb++;
	else
	    notro++;
	i++;
    }
    if (nvacia == 1 && notro == 0 && nsimb == t -> dim - 1) {
        struct jaque * jq = malloc (sizeof (struct jaque));
        jq -> jdor = jdor;
        jq -> celda = celda;
	agregar_al_final (res, jq);

	celda = malloc (sizeof (struct celda));
    }
    if (fila != col) {
	free (celda);
	return res;
    }

    /* me fijo una diagonal */
    i = nvacia = notro = nsimb = 0;
    while (i < t -> dim && notro == 0 && nvacia <= 1) {
	c = t -> celdas [i] [t -> dim - 1 - i];
	if ( c == C_VACIA ) {
	    nvacia++;
	    celda -> fila = i;
	    celda -> col = t -> dim - 1 - i;
	}
	else if ( c == jdor -> simbolo )
	    nsimb++;
	else
	    notro++;
	i++;
    }
    if (nvacia == 1 && notro == 0 && nsimb == t -> dim - 1) {
        struct jaque * jq = malloc (sizeof (struct jaque));
        jq -> jdor = jdor;
        jq -> celda = celda;
	agregar_al_final (res, jq);

	
	celda = malloc (sizeof (struct celda));
    }
    i = nvacia = notro = nsimb = 0;
    while (i < t -> dim && notro == 0 && nvacia <= 1) {
	c = t -> celdas [i] [col];
	if ( c == C_VACIA )
	    nvacia++;
	else if ( c == jdor -> simbolo )
	    nsimb++;
	else
	    notro++;
	i++;
    }

    if (nvacia == 1 && notro == 0 && nsimb == t -> dim - 1) {
        struct jaque * jq = malloc (sizeof (struct jaque));
        jq -> jdor = jdor;
        jq -> celda = celda;
	agregar_al_final (res, jq);

	
	celda = malloc (sizeof(struct celda));
    }
    free (celda);
    return res;
}

   
