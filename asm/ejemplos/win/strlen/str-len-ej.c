#include <stdio.h>

extern unsigned str_len (char *);

int main () {
  char * s = "123456789";
  printf ("%d", str_len (s));
}

