#include <stdio.h>
// a & b & 1 es verdadero si y solo si a*b es impar.
int main()
{
    
    printf("1 & 1 & 1 : %d\n", 1 & 1 & 1);
    printf("1 & 2 & 1 : %d\n", 1 & 2 & 1);
    printf("2 & 1 & 1 : %d\n", 2 & 1 & 1);
    printf("2 & 2 & 1 : %d\n", 2 & 2 & 1);

    printf("3 & 2 & 1 : %d\n", 3 & 2 & 1);
    printf("10 & 20 & 1 : %d\n", 10 & 20 & 1);
    printf("21 & 7 & 1 : %d\n", 21 & 7 & 1);
    printf("1122 & 2110 & 1 : %d\n", 1122 & 2110 & 1);

    printf ("Con más factores también funciona:\n");
    printf("10 & 20 & 1 & 1 : %d\n", 10 & 20 & 1 & 1);
    printf("210 & 72 & 14& 1 : %d\n", 210 & 72 & 14 & 1);

    printf("101 & 23 & 17 & 1 : %d\n", 101 & 23 & 17 & 1);
    printf("21 & 72 & 1& 1 : %d\n", 21 & 72 & 1 & 1);


    return 0;
}


int producto_impar(int a, int b)
{
    return a & b & 1;
}
