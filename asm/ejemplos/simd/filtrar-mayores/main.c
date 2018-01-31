#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>


#define CHICO 32
#define MEDIANO 64
extern long filtrar_mayores (int *, short, int);
void llenar_rand_vector (int *v, int dim,int max);
void print_vector (int *v, int dim);
void clear_vector (int *v, int dim);
int * nuevo_vector(int dim);




int main (int argc, char** argv) {

    int DIM =  3;

    int * v = nuevo_vector(DIM);
    llenar_rand_vector (v, DIM, 1000);
    print_vector(v, DIM);
    filtrar_mayores(v, 500, DIM);
    print_vector(v, DIM);
}

void print_vector (int *v, int dim) {
    int i;
    for (i = 0; i < dim; i++) {
         if (i % 8 == 0) 
             printf("\n%5d:  ", i);
        printf("%x\t", v[i]);
       
    }
    puts("");
}

void llenar_rand_vector(int *v, int dim, int max) {
    int i;
    for (i = 0; i < dim; i++)
        v[i] = rand() % max;
}

void clear_vector (int *v, int dim) {
    int i;
    for (i = 0; i < dim; i++) 
        v[i] = 0;
}

int * nuevo_vector(int dim) {
    int * res = malloc(sizeof(int) * dim);
    if (!res) { puts("Fallo malloc."); exit(1); }
    return res;
}
