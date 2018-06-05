#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>

void ints_print (int* arr, unsigned size) {
    int i = 0;
     while ( i < size ) {
         printf ("%2d: %18d ", i, arr[i]);
         i++;
         if (i % 5 == 0)
             puts("");
     }
     if (i % 5 != 0)
         puts("");

}
