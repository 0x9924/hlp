#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <ctype.h>
#include <limits.h>

int main(int argc, char ** argv)
{
    
    long long x;

    char * tail;
    int i;
    for (i = 1; i < argc; i++) {
        errno = 0;
        x = strtoull (argv[i], &tail, 10);
        
        if (errno || x >  CHAR_MAX || x < CHAR_MIN) { puts("not a char"); }
        else if (isprint(x)){
            printf ("%c\n", (char) x);
        } else {
            puts("non printable");
        }
    }
}
