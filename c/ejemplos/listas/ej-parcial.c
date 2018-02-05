#include <stdio.h>
#include "nodo1.h"

int main () {
    struct nodo * l = lista_zigzag();
    //nodo_print(l);
    struct nodo * cl, *nl;
    reordenar(l, &cl, &nl);
    puts("Los que cumplen:");
    nodo_print (cl);
    puts("Los que no:");
    nodo_print (nl);
    
}
             

             
