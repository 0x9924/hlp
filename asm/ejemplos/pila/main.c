#include <stdio.h>


extern unsigned long leer_rsp ();

int main () {
     long unsigned rsp = leer_rsp();
     printf ("rsp: %x\n", rsp);
     return 0;
}
