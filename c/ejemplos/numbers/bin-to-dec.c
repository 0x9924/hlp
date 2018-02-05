#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <math.h>

void bin_to_dec (char * bin);
    
int main (int argc, char ** argv)
{
    if (argc < 2) {
        puts("Dar un parametro");
        return 0;
    }

    int i = 1;
    for (; i <  argc; i++)
        bin_to_dec ( argv[i] );
    return 0;
}

void bin_to_dec (char * bin)
{
    unsigned len = 0;
    unsigned counter = 0;
    unsigned long dec = 0;

    while ( bin[len] )
    {
        if (bin[len] != '1' && bin[len] != '0') {
            puts("Parametro incorrecto!");
            return;
        }
        len++;
    }

    counter = len;
    
    while ( counter > 0 )
    {
        if (bin[counter - 1] == '1')
            dec += pow (2, len - counter);
        else if (bin[counter - 1] != '0') {
        }
            
        counter--;
    }
    printf("%d\n", dec);
}
