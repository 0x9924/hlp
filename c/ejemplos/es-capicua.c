#include <stdio.h>

int capicua(char *string);

int main(int argc, char *argv[])
{
  char * string = argv[1];
  printf("string: %s\n", string);
  char * respuesta =  capicua(string) ? "Si" : "No";
  printf("\nEs capicua?\n Respuesta: %s", respuesta);
  return 0;
}


int capicua(char *string)
{
  if (!string) return 1;
  char * p, * q;
  q = p = string;
  while(*q) q++;
  int ctr = 0;
  
  while( *p++ == *(--q) )
  {
    printf("%d:\t*p: '%c'\t *q: '%c'\n",
	   ++ctr, *(p-1), *q);
    if ( p >= q ) return 1;
  }

  return 0;
}

  
    
