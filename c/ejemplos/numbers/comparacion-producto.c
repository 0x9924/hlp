#include <stdio.h>
#include <stdlib.h>



#include <unistd.h>

unsigned long long producto(unsigned long long a, unsigned long long b);

int main (int argc, char ** argv)
{
   char c;
   int asterisco = 0;
   unsigned long long m = 100;
   while ((c = getopt (argc, argv, "a")) != -1)
   {
      switch (c)
      {
	 case 'a':
	    printf("uso * (asterisco)\n");
	    asterisco = 1;
	    break;
	 case '?':
	    if (isprint (optopt))
	    {
	       fprintf (stderr, "Opcion desconocida `-%c'.\n", optopt);
	    }
	    else
	       fprintf (stderr,
			"Caracter de opcion desconocido `\\x%x'.\n",
			optopt);
	    return 1;
	 default:
	    abort ();
      }
   }
   
   m = atoll(argv[argc-1]);

   unsigned long long i, j;
   printf("calculando el producto ij para i,j=1, ..., %llu\n",m);
   for (i = 0; i < m; i++)
   {
      for (j = 0; j < m; j++)
      {
	 if (asterisco) i*j;
	 else producto (i, j);
      }
   }
   printf("fin\n");
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
				
