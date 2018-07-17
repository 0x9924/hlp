#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>


#include "ga-print.h"

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


void ints_print_hex (int* arr, unsigned size) {
    int i = 0;
     while ( i < size ) {
         printf ("%2d: %18x ", i, arr[i]);
         i++;
         if (i % 5 == 0)
             puts("");
     }
     if (i % 5 != 0)
         puts("");
}

void ints_print_bin (int* arr, unsigned size) {
    int i = 0;
     while ( i < size ) {
         printf("%2d: ", i);
         prbitsINT32 (arr[i]);
         i++;
         if (i % 5 == 0)
             puts("");
     }
     if (i % 5 != 0)
         puts("");
}
