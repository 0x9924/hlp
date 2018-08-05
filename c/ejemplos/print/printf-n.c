/*
 * Example using %n for printf format string
 */
#include <stdio.h>




int main (int argc, char ** argv) {
     int n;
     for (int i = 0; i < argc; i++) {
          printf("%s%n ", argv[i], &n );
          printf("tiene %d caracter(es)\n", n);
     }
}
