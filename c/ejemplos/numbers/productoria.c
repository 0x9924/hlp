#include <stdio.h>
#include <stdlib.h>

void print_help();

int main(int argc, char ** argv)
{
   
   if (argc == 1) { print_help(); return 0; }

   long long producto = 1;

   for(int i = 1; i < argc; i++)
      producto *= atoll(argv[i]);

   printf ("%lld", producto);
}
   
void print_help()
{
   printf("productoria: devuelve el producto de los argumentos\n\
 si es que se pueden interpretar como números\n");

}
