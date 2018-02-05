#include <stdio.h>
#include <stdlib.h>

unsigned long long producto(unsigned long long a, unsigned long long b);

int main (int argc, char ** argv)
{
    if (argc != 3) return 0;
    unsigned long long a, b, p;
    a = atoll(argv[1]);
    b = atoll(argv[2]);
    printf("a: %ull, b: %ull\n", a, b);
    p = producto(a,b);
    printf("a*b == %llu, prod(a,b) == %llu", a*b, p);
    
}


unsigned long long producto(unsigned long long a, unsigned long long b)
{
    unsigned long long producto = 0;
    int digito = 0;
    
    while (b)
    {
	unsigned long long sumando = a << digito;
	if ( b & 1 ) producto += sumando;
	b >>= 1;
	digito++;
	
    }
    return producto;
}
				
