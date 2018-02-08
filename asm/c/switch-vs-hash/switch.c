#include <stdio.h>
#include "switch-vs-hash.h"
const int veces = 9999999;
#include <stdlib.h>
#include <time.h>

void foo () {
     int x =  rand() % 14;
     float a = 9.0f;
     float b = 12.01f;
     void * r;
     switch (x) {
     case 1:// int
          sum_floats(&r, &a, &b);
          break;
     case 0:
          sum_floats(&r, &a, &b);
          break;
     case 3:
          sum_floats(&r, &a, &b);
          break;
     case 2:
          sum_floats(&r, &a, &b);
          break;
     case 4:
          sum_floats(&r, &a, &b);
          break;
     case 5:
          sum_floats(&r, &a, &b);
          break;
     case 6:
          sum_floats(&r, &a, &b);
          break;
     case 7:
          sum_floats(&r, &a, &b);
          break;
     case 8:
          sum_floats(&r, &a, &b);
          break;
     case 9:
          sum_floats(&r, &a, &b);
          break;
     case 10:
          sum_floats(&r, &a, &b);
          break;
     case 11:
          sum_floats(&r, &a, &b);
          break;
     case 12:
          sum_floats(&r, &a, &b);
          break;
     case 13:
          sum_floats(&r, &a, &b);
          break;
     default:
          sum_floats(&r, &a, &b);
     }
     
     return;
}

int main () {

     srand((unsigned) time(0));

     for (int i = 0; i < veces; i++)
          foo();
}
