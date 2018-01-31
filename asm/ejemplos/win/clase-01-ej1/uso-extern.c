#include <stdio.h>


extern int unosc ();
extern int equissc (int);
extern int uno ();
extern int equis (int);
extern int add (int, int);

int main () {
  printf ("uno sin convención: %d\n", unosc ());
  printf ("equis sin convención 4: %d\n", equissc(4));
  printf ("uno: %d\n", uno ());
  printf ("equis (3): %d\n", equis(3));
  printf ("add: 5 + 8: %d\n", add (5, 8));

  return 0;
}
