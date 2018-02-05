#include <stdio.h>

#define endl printf("\n");

#define testSumOverflow(a, b)			\
    printf("a: %d, b: %d\n", a, b); \
    printf("a+b es %d\t", (unsigned char) (a+b));			\
    printf("(a + b) %% 256 es: %d\n\n", (((int)a + (int)b) % 256) );	\


int main (int argc, char ** argv)
{
    endl;
    printf("La suma + entre dos numeros unsigned que desborda el tipo\n");
    printf("devuelve la suma modulo el tamaño del tipo.\n\n");
    testSumOverflow(200, 206);
    testSumOverflow(234, 42);
    testSumOverflow(214, 142);
    testSumOverflow(130, 143);

    return 0;
}
