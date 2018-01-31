#include <stdio.h>

int main ()
{
  int c;
  puts ("C-d para salir.");

  do
  {
    c=getchar();
    putchar (c);
  }
  while (c != EOF);

  return 0;
}
