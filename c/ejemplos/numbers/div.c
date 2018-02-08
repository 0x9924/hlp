#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

typedef unsigned char T;
#define BITS_OF_T sizeof(T) << 3

#define set_bit0_with_ith_2wd(R, Nl, Nr, i)                             \
     do {                                                               \
         T *P = i < BITS_OF_T ? &Nr : &Nl;                              \
        (R) = ((R) & (~(T)0 << 1)) | (((*P) >> (i % BITS_OF_T )) & 1);  \
    } while (0)                                                         \

T ith_bit_2integers(T high, T low, T i) {                                
     if (i < BITS_OF_T) 
          return (low >> i) & 1;
     else
          return (high >> (i-BITS_OF_T)) & 1;
}
#define set_ith_bit(Q,i)                                            \
     (Q) = ((Q) | ~((T)1 << i)) 

void div_2integers (T *highbits , T *lowbits , T d, T *rem)
{
    T Q, R;
    Q = R = 0;
    T i;
    for (i = 2*BITS_OF_T; i > 0 ; i--) {
        R <<= 1;
        T ith_bit = ith_bit_2integers (*highbits, *lowbits, i-1);
        //set_bit0_with_ith_2wd(R, *highbits, *lowbits, (i - 1));
        R |= ith_bit;
        if (R >= d) {
            R -= d;
            set_ith_bit(Q, (i - 1));
        }
    }
    *lowbits = Q; *rem = R;
}

int main (int argc, char ** argv) {
     char * cptr;
     if (argc != 3) { puts("uso: div NUM NUM"); exit(0); }
     unsigned long x, y, x_div_y_long, x_mod_y_long;
     T low, high;
     x = strtoul(argv[1], &cptr, 10);
     y = strtoul(argv[2], &cptr, 10);
     assert (x < 0x10000 && y < 0x100);
     low = x & 0xff;
     high = (x>>8) & 0xff;
     printf ("\nx: %u \t\t high: %u\tlow: %u\n"
             "y: %u\n", x, high, low, y);
     x_div_y_long = x / y;
     x_mod_y_long = x % y;

     puts("\nlong\n====");
     printf ("x / y : %u \n" "x %% y : %u\n", x_div_y_long, x_mod_y_long);
     printf ("HIGH: %u\tLOW:%u\n",0xff & (x_div_y_long>>8), 0xff&x_div_y_long);
     puts("\n_div_\n=====");

     T rem;
     div_2integers (&high, &low, y, &rem);
     printf ("x div y HIGH: %u \n"
             "x div y LOW: %u\n"
             "x mod y: %u",high, low, rem);
          
}
