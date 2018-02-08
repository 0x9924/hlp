#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <assert.h>

typedef unsigned char T;

const unsigned BITS_OF_T = sizeof(T) * 8;

#define lshift_1bit(L, R)                                          \
    do {                                                           \
        (L) = (L) << 1 & (( ~(T)0 << 1 ) | (R) >> BITS_OF_T - 1);  \
        (R) <<= 1;                                                 \
    } while (0)                                                    \

#define set_0bit_with_ith(R,N,i)                        \
    (R) = (R) & (~(T)0 << 1) | (((N) >> (i)) & 1)       \



#define set_0bit_with_ith_2w(R, Nl, Nr, i)                              \
    do {                                                                \
        T *P = i < BITS_OF_T ? &Nr : &Nl;                                 \
        (R) = (R) & (~(T)0 << 1) | (((*P) >> (i % BITS_OF_T )) & 1);   \
    } while (0)                                                         \

          
     
/* #define set_ith_bit1(Q,i) \ */
/*     (Q) = ((Q) & ~((T)1 << i)) | ((T)1<<i)                              \ */
#define set_ith_bit(Q,i) \
    (Q) |=  ((T)1 << i)


void div2b (T *hbits, T *lbits, T d, T *rem);


int main (int argc, char **argv)
{
    if (argc != 3) { puts("Usage: prog NUMBER NUMBER\n"); return 0; }

    unsigned long x, d;
    errno = 0;
    char * tail;
    x = strtoul (argv[1], &tail, 10);
    if (errno) { puts("primer numero demasiado grande"); return 0; }
    d = strtoul (argv[2], &tail, 10);
    if (errno) { puts("tercer numero demasiado grande"); return 0; }


    assert ( x < 0x10000 && d < 0x100);
    printf("x: %lx \t  d: %lx \n" , x, d);
    
    puts("");
    
    T quot, rem, ri, le;
    ri = x & 0xff;
    le = 0xff & (x >> BITS_OF_T);
    //div2 (le, ri,d, &quot, &rem);
    div2b(&le, &ri, d, &rem);
    printf ("hbits: 0x%x \t lbits: 0x%x \n", ri, le );


    printf ("     => x/d: %lx \t" "x%%d: %lx\n", x/d, x%d);

    printf("div2 =>  quot: hi: %x lo: %x \t rem: %x ", le, ri, rem);
    puts("");
    return 0;
}



void div2 (T hbits, T lbits, T d, T *quot, T *rem)
{
    T Q, R;
    Q = R = 0;
    int i;
    for (i = 2*BITS_OF_T - 1; i >= 0 ; i--) {
        R <<= 1;
        set_0bit_with_ith_2w(R, hbits, lbits, i);
        if (R >= d) {
            R -= d;
            set_ith_bit(Q, i);
        }
    }
    *quot = Q; *rem = R;
}

void div2b (T *hbits, T *lbits, T d, T *rem)
{
     T Q, R;
     Q = R = 0;
     int i;
     for (i = 2*BITS_OF_T - 1; i >= 0 ; i--) {
          R <<= 1;
          set_0bit_with_ith_2w(R, *hbits, *lbits, i);
          if (R >= d) {
               R -= d;
               set_ith_bit(Q, i);
          }
     }
     *hbits /= d; *lbits = Q; *rem = R;
}
