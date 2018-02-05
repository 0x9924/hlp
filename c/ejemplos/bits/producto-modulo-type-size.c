#include <stdio.h>

#define endl printf("\n");

int main (int argc, char ** argv)
{
    endl;
    printf("El producto * entre dos numeros unsigned que desborda el tipo\n");
    printf("devuelve el producto modulo el tamaño del tipo.\n\n");
    printf("Ejemplo, sean 0 <= a,b < 256.\na = 100, b = 20\n");
    unsigned char a, b;
    a = 100; b = 20;
    printf("a*b es %d\n", (unsigned char) (a*b));
    printf("O sea, a*b devuelve (a*b) %% 256, que es (unsigned char) ~0 + 1 ");
    printf(":  %d", (unsigned char) ~0 + 1);
    return 0;
}
