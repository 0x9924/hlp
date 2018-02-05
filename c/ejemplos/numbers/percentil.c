#include <stdio.h>
#include <stdlib.h>

#define length(x) (sizeof(x)/sizeof(*x))
int main()
{
    int porcentaje = 1;

    
    long baremo[] = { 8, 1, 2, 1, 1};
    int len = length(baremo);
    int acumulada = 0;
    
    int suma = 0;
    for (int i = 0; i < len ; i++) suma += baremo[i];

    
    for (int i = 0; i < len ; i++)
    {
	acumulada += baremo[i];
	printf("%8d  |%8d  | %8d  | %8d\n",
	       i, baremo[i], acumulada, (acumulada * 100 )/suma);
    }
    

    printf ("\nsuma: %d\n", suma);
    int acum = 0;
    int j = 0;
    
    while ( acum * 100 <= suma * porcentaje && j < len)
    {
	acum += baremo[j];
	j++;
    }

    printf("\n percentil %d = %d\n", porcentaje, j - 1);
    return 0;
}
