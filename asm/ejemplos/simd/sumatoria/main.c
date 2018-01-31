#include  <stdio.h>
#include <stdlib.h>
#include<stdint.h>
#include "../../../../c/ejemplos/rand/random-bytes.h"

unsigned size = 4 * 1000000;
const int colsize = 8;
  
typedef struct {
     unsigned  numero : 31;
     int validez : 1;
}__attribute__((packed)) numero;


extern unsigned sumatoria_positivos (numero * nums, int tamanio);
extern float promedio_negativos (numero * nums, int tamanio);
extern void extender_a_32 (numero * nums, int tamanio);
extern void extender_a_32_validos (numero * nums, int tamanio);
extern float ratio_pares_impares (numero * nums, int tamanio);

numero* data_sumatoria (unsigned  * rb) {
     unsigned suma;
     numero * nums = malloc (4 * size);
     int i;
     for (i = 0; i < size; i++) {
          nums[i].numero = rb[i] & 0x40000000
               ? rb[i] | 0x7fffff00
               : rb[i] & 0xff;
          nums[i].validez = rb[i] >> 31;
     }
     return nums;
}

numero* data_promedio (unsigned  * rb) {
     float media;
     
     numero * nums = malloc (4 * size);
     int i;
     
     for (i = 0; i < size; i++) {
          
          nums[i].numero = rb[i] >> 30 & 1
               ? rb[i] | 0x7fffff00
               : rb[i] & 0xff;
          nums[i].validez = rb[i] >> 31;
     }
     return nums;
}

numero* data_extender_a_32(unsigned *rb) {
     numero * nums = malloc (4 * size);
     int i;
     for (i = 0; i < size; i++) {
          nums[i].numero = rb[i]  ;
          nums[i].validez = rb[i] >> 31;
          printf ("%x,%s",
                 nums[i].numero, (i+1) % colsize == 0 ? "\n" : " ");
     }
     return nums;
}

numero* data_ratio_pares_impares (unsigned *rb) {
     float ratio;
     int pares, impares; pares = impares = 0;
     numero * nums = malloc (4 * size);
     int i;
     
     for (i = 0; i < size; i++) {
          unsigned numero = rb[i] & 0xff; 
          nums[i].numero = numero & 0xff; 
          nums[i].validez = rb[i] >> 31;
     }
     return nums;
  
}

unsigned  * nonrand_data(unsigned nbytes, unsigned data) {
     unsigned * res = malloc (nbytes);
     int i = 0;
     for (i = 0 ; i < nbytes/4; i++) {
          res[i] = data;
     }
     return res;
}


int main () {
     printf("size: %d\n", size);
     unsigned  * rb = (unsigned *) random_bytes (size * 4 * 4);
     numero * nums[3];
     
     nums[0] = data_sumatoria(rb);
     nums[1] = data_promedio(rb);
     nums[3] = data_ratio_pares_impares(rb);

     printf("sumatoria positivos:\t %u\n"
            "promedio negativos: \t %f\n"
            "ratio pares impares:\t %f\n",
            sumatoria_positivos (nums[0], size),
            promedio_negativos(nums[1], size),
            ratio_pares_impares(nums[3], size));
            

     unsigned x = -1;
}
