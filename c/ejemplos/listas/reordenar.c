#include <stdio.h>
#include <stdlib.h>
/*
  reordenar
  pone los negativos al ppio en orden inverso al que estaba
  y los no negativos al final, en el orden en que estaban
*/
#define len(ARR) sizeof(ARR)/sizeof(*(ARR))

struct numero{
     int valor;
     struct numero * sig;
};

typedef struct numero numero;


void reordenar (numero ** ns) {
     numero * negs = 0x0;
     numero **poss = ns;
     numero *actual = *ns;

     while (actual) {
	  if (actual -> valor < 0) {
	       numero * tmp = actual;
	       actual = actual -> sig;
	       tmp -> sig = negs;
           negs = tmp;
	  } else {
	       *poss = actual;
	       poss = &(actual -> sig);
	       actual = actual -> sig;
	  }
     }
     *poss = negs;
}

numero * arr2list (int * arr, unsigned len, numero ** list) {
     numero * ret = *list;
     while (len > 0) {
          numero * n = malloc (sizeof(numero));
          n -> valor = arr[--len];
          n -> sig = 0x0;
          *list = n;
          list = &(n -> sig);
     }
}

void print_list (numero * lista) {
     for ( ; lista; lista = lista -> sig) 
          printf ("%d ", lista -> valor);
     
}

int main () {
     int arr[12] = { -1, 2, 4, -5, 8,
                     9, 12, -22, -3, -12,
                     1, 78 };
     numero * lista = 0x0;
     arr2list (arr, len(arr), &lista);
     print_list (lista);

     reordenar(&lista);
     puts("\ndespues:");
     print_list (lista);
}
