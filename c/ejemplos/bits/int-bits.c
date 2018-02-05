#include "prbits.h"

int main (int argc, char ** argv)
{

    int a = 0, b = 1, c;
    unsigned int ua = 0U, ub = 1U;
    printf("a = 0, b = 1;\n");
    printf("a es \t"); prbitsINT(a);
    printf("\nb es \t"); prbitsINT(b);
    printf("\n~a es \t"); prbitsINT(~a);
    printf("\n~b es \t"); prbitsINT(~b);
    printf("\n");
    
    printf("\nUINT_MAX es\t\t"); prbitsINT(UINT_MAX);
    printf("\nUINT_MAX + 1 es\t\t"); prbitsINT(UINT_MAX+ 1);
    printf("\n0 - 1 es \t\t"); prbitsINT(0 - 1);
    printf("\n0U - 1 es \t\t"); prbitsINT(0U - 1);


    printf("\n\nComparaciones\n");

    unsigned vval = UINT_MAX == (~(0U));
    printf("\nUINT_MAX == ~0 :"); prbool(vval);

    vval = 0 == 0;
    printf("\n0 == 0 : "); prbool(vval);

    
    vval = UINT_MAX == 0 - 1;
    printf("\nUINT_MAX == (0 - 1) : "); prbool(vval);

    
    printf("\nint 0\t\t");
    prbitsINT(0);

    printf("\nint 1\t\t");
    prbitsINT(1);

    printf("\nint 0x16\t");
    prbitsINT(0xFF);

    printf("\n1 << 30\t\t");
    prbitsINT(1 << 30);

    printf("\n1 << 31\t\t");
    prbitsINT(1 << 31);

    printf("\n1 << 8* sizeof(int) - 1\n:\t\t");
    prbitsINT(1 << 8 * sizeof(int) - 1);

    // Cuento el numero de bits en un int:
    int nbits = 0;
    for (int i = 1; i; i <<= 1, nbits++);

    printf("\n\nfor (int i = 1; i; i <<= 1, nbits++);");
    printf("\n bits == %d\n", nbits);

    nbits = 0;
    for (long long l = 1; l; l <<= 1, nbits++);
    printf("\n\nfor (long long l = 1; l; l <<= 1, nbits++);");
    printf("\n bits == %d\n", nbits);

    printf ("\n~0 como %%ud es %u", ~(0U));
    unsigned int x, y, z; x = y  = 999999999U;
    printf("\nx  == %u, y == %u", x, y);

    // overflow, devuelve el modulo (~0 + 1):
    z = x * y;
    
    printf("\nz = x * y es : %u", z);
}

