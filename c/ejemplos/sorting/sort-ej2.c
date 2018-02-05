#include <stdio.h>
//#include <stdlib.h>
#include <librandbytes.h>

void quicksort(char* a, long len);
const int len = 0xffffff;

void printarray(char* a, int len, int cols) {
     for (int i = 0; i < len; i++) {
          if (i % cols == 0)
               puts("");
          printf("%4d ", a[i]);
     }
     puts("");
};

int cmp_char (char *c, char *y) {
     return (*c) - (*y);
}

int main() {

     char *b = (char *) random_bytes(len);
     //printarray(b, len, 12);
     //quicksort(b, len);
     qsort(b, len, 1, cmp_char);
     //printarray(b, len, 12);
}
