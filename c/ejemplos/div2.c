#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include "bits/prbits.h"

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


#define set_ith_bit1(Q,i) \
    (Q) = ((Q) & ~((T)1 << i)) | ((T)1<<i)                              \

void div2 (T left, T right, T d, T *quot, T *rem);


int main (int argc, char **argv)
{
    if (argc != 4) {
        puts("Usage: prog NUMBER NUMBER  NUMBER\n");
        return 0;
    }

    T x, y, d;
    errno = 0;
    char * tail;
    x = strtoul (argv[1], &tail, 10);
    if (errno) { puts("primer numero demasiado grande"); return 0; }
    y = strtoul (argv[2], &tail, 10);
    if (errno) { puts("segundo numero demasiado grande"); return 0; }
    d = strtoul (argv[3], &tail, 10);
    if (errno) { puts("tercer numero demasiado grande"); return 0; }

    unsigned long long l = x*256 + y;
    printf("(x: %d\t y: %d) "
           "l: %llu"
           "\tdivsor: %d\n", x, y, l, d);
    
    prbits(x);printf(" ");prbits(y);printf("/%d",d);
    puts("");
    
    T quot, rem;

    div2 (x, y, d, &quot, &rem);

    printf("res\ncociente: %u == x%x\tresto: %u", quot,quot, rem);
    puts("");
    return 0;
}



void div2 (T left, T right, T d, T *quot, T *rem)
{
    T Q, R;
    Q = R = 0;
    int i;
    for (i = 2*BITS_OF_T - 1; i >= 0 ; i--) {
        R <<= 1;
        set_0bit_with_ith_2w(R, left, right, i);
        if (R >= d) {
            R -= d;
            set_ith_bit1(Q, i);
        }
    }
    *quot = Q; *rem = R;
}
