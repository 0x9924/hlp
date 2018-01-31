#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>


#define CHICO 32
#define MEDIANO 64
extern long extender_vector_ubw (unsigned char *v,
                                 unsigned short *v_ext, int);
void llenar_rand_vector (unsigned char *v, int dim,int max);
void print_uchar_vector (unsigned char *v, int dim);
void print_ushort_vector (unsigned short *v, int dim);

void clear_vector (int *v, int dim);
unsigned char * nuevo_uchar_vector(int dim);
unsigned short * nuevo_ushort_vector(int dim);
void test0 (unsigned char * v, unsigned short *w, int dim);



int main (int argc, char** argv) {

    int DIM =  40;

    unsigned char * v = nuevo_uchar_vector(DIM);
    unsigned short * w = nuevo_ushort_vector(DIM);
    llenar_rand_vector (v, DIM, 256);
    print_uchar_vector(v, DIM);
    extender_vector_ubw(v, w, DIM);
    print_ushort_vector(w, DIM);
    test0(v,w,DIM);
}

void print_uchar_vector (unsigned char *v, int dim) {
    int i;
    for (i = 0; i < dim; i++) {
         if (i % 8 == 0) 
             printf("\n%5d:  ", i);
        printf("%x\t", v[i]);
       
    }
    puts("");
}

void print_ushort_vector (unsigned short *v, int dim) {
    int i;
    for (i = 0; i < dim; i++) {
         if (i % 8 == 0) 
             printf("\n%5d:  ", i);
        printf("%x\t", v[i]);
       
    }
    puts("");
}

void llenar_rand_vector(unsigned char *v, int dim, int max) {
    int i;
    for (i = 0; i < dim; i++)
        v[i] = rand() % max;
}

void clear_vector (int *v, int dim) {
    int i;
    for (i = 0; i < dim; i++) 
        v[i] = 0;
}

unsigned char * nuevo_uchar_vector(int dim) {
    unsigned char * res = malloc(sizeof(char) * dim);
    if (!res) { puts("Fallo malloc."); exit(1); }
    return res;
}

unsigned short * nuevo_ushort_vector(int dim) {
    unsigned short * res = malloc(sizeof(short) * dim);
    if (!res) { puts("Fallo malloc."); exit(1); }
    return res;
}

void test0 (unsigned char * v, unsigned short *w, int dim) {
    int i;
    puts("v_byte\t\tv_short\t\tv_byte << 4\tv_short << 4");
    for (i = 0; i < dim ; i++) {
        printf (" %x \t\t %x\t\t  ", v[i], w[i]);
        v[i] <<= 4;
        w[i] <<= 4;
        printf ("%x \t\t %x\n", v[i], w[i]);
    }
}
