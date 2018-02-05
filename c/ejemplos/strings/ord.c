#include <stdio.h>
#include <string.h>

void main (int argc, char ** argv) {
    int i;
    for (i = 1; i < argc; i++) {
        int len = strlen (argv [i]);
        int j;
        for (j = 0; j < len; j++) {
            printf ("%d ", argv [i][j]);
        }
        puts("");
    }
}
