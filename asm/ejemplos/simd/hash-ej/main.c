#include <stdio.h>

#define SIZE 64
extern void hashear (int *arreglo, unsigned k);
extern void cmp_menos1 (int *arreglo, unsigned tam);
extern void triple (int *arreglo, unsigned tam);

int main () {
  int arreglo[SIZE] = {
    -1, 2, 3, 4, -3, -2, -1, 0,-1, 2, 3, 4, -3, -2, -1, 0,
    -1, 2, 3, 4, -3, -2, -1, 0,-1, 2, 3, 4, -3, -2, -1, 0,
    -1, 2, 3, 4, -3, -2, -1, 0,-1, 2, 3, 4, -3, -2, -1, 0,
    -1, 2, 3, 4, -3, -2, -1, 0,-1, 2, 3, 4, -3, -2, -1, 0

  };
  for (int i = 0; i < SIZE; i++) {
    printf("%2d%s", arreglo[i],
           (i+1) % 8 == 0 ? "\n" : " ") ;
    
  }
  puts("");
  hashear (arreglo, SIZE);
  for (int i = 0; i < SIZE; i++) {
    printf("%2d%s", arreglo[i],
           (i+1) % 8 == 0 ? "\n"  :" ") ;
  }
  puts("");
}

