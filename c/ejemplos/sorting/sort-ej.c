#include <stdio.h>
#include <librandbytes.h>

void quicksort(char* a, int len);
const long len = 0xffffff;

void printarray(char* a, int len, int cols) {
     for (int i = 0; i < len; i++) {
          if (i % cols == 0)
               puts("");
          printf("%4d ", a[i]);
     }
     puts("");
};

int main() {

     char *b = (char *) random_bytes(len);
     //printarray(b, len, 12);
     quicksort(b, len);
     //printarray(b, len, 12);
}
