#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <math.h>

void int_to_bin (int dec);
    
int main (int argc, char ** argv)
{
    if (argc < 2) {
        puts("Dar un parametro");
        return 0;
    }

    int i = 1;
    for (; i <  argc; i++)
      int_to_bin ( atoi ( argv[i] ));

    return 0;
}

void int_to_bin (int dec)
{
    unsigned bit = 1;
    unsigned espacio = 0x88888888;

    while ( bit << 1 )
        bit <<= 1;
    
    while ( bit ) {
        if (bit & dec)
            printf("1");
        else
            printf("0");

        if ( espacio & 1 )
            printf(" ");
            
        bit >>= 1;
        espacio >>= 1;
    }
    puts("");

}
