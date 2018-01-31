#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>


#define CHICO 32
#define MEDIANO 64
extern long mul_vec_pot2 (int *, short, int);
long c_mul_vec_pot2 (int *vec, short pot, int dim);
void comparar_implementaciones (short pot, int dim, int max);
int main (int argc, char** argv) {


    int pot, dim, max;
    if (argc == 4) {
        pot = atoi(argv[1]);
        dim = atoi(argv[2]) * 4;
        max = atoi(argv[3]);
    } else if (argc == 2) {
        puts("./main POT DIM MAX"); return 0;
    } else {

        pot = 3;
        dim = 4 * 1024 * 1024;
        max = 10;

    }
    comparar_implementaciones (pot, dim, max);
    

}

long c_mul_vec_pot2 (int *vec, short pot, int dim) {
   long i;
    for (i = 0; i < dim; i++) {
        vec[i] <<= pot;
    }
    return i;
}

void comparar_implementaciones (short pot, int dim, int max) {
    int * impl_c = malloc (sizeof(int) * dim);
    int * impl_asm = malloc (sizeof(int) * dim);
    if (!(impl_c && impl_asm)) {
        puts("Fallo malloc"); exit(1);
    }
    clock_t start, end, delta_c, delta_asm;
    
    int i;
    for (i = 0; i < dim; i++) 
      impl_c[i] = impl_asm[i] = rand() % max;

    start = clock();
    long ciclos_asm = mul_vec_pot2 (impl_asm, pot, dim);
    end = clock();
    delta_asm = end - start;

    start = clock();
    long ciclos_c = c_mul_vec_pot2 (impl_c, pot, dim);
    end = clock();
    delta_c = end - start;

    for (i = 0; i < dim; i++) {
        if (impl_c[i] != impl_asm[i]) {
            printf("Error en la cuenta.\n"
                   "pot: %d\tdim: %d\tmax: %d\t=ri: %d",
                   pot, dim, max, i);
        }
    }
    puts("test ok.");
    printf("implementacion c:\n\tciclos: %ld\tticks: %ld\n",
           ciclos_c, delta_c);
    printf("implementacion asm:\n\tciclos: %ld\tticks: %ld\n",
           ciclos_asm, delta_asm);

    printf ("c/asm:\n\t"
            "ticks: %lf\n",
            (double)delta_c/(double)delta_asm);

}
