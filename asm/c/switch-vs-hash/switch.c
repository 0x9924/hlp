#include <stdio.h>
#include "switch-vs-hash.h"

int main () {
     int x = 0;
     int a = 9;
     int b = 12;
     void * r;
     switch (x) {
     case 0:// int
          sum_ints(&r, &a, &b);
          break;
     case 1:
          sum_floats(&r, &a, &b);
          break;
     case 2:
          sum_strings(&r, &a, &b);
          break;
     default:
          sum_floats(&r, &a, &b);
     }
     
     return 0;
}
