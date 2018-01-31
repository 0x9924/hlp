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

long sumatoria_positivos_en_c (numero * nums, int tam) {
     int i;
     long res = 0;
     for (i = 0; i < tam; i++) {
          if (nums[i].validez && !(nums[i].numero & 0x40000000)) {
               res += nums[i].numero;
          } else {
               //printf("%x ", nums[i].numero);
          }
     }
     return res;
}

float promedio_negativos_c  (numero * nums, int tam) {
     int i;
     unsigned suma = 0;
     puts("promedio_c:");
     for (i = 0; i < tam; i++) {
          if (nums[i].validez && nums[i].numero & 0x40000000) {
               suma += nums[i].numero | 0xa0000000;
               //rintf ("\tsuma: %d\t suma_fl: %f\n", suma, (float)suma);
          }
     }
     float suma_float = ((float)-suma)*(-1);
     /* printf("\tsuma_int %d\ttam_int\t%d\t suma_fl: %f\n", */
     /*        suma, tam, suma_float); */
     return suma_float/tam;
}



void test_sumatoria (unsigned  * rb) {
     puts("sumatoria_positivos\n"
          "===================");
     unsigned suma, suma_c = 0;
     numero * nums = malloc (4 * size);
     int i;
     for (i = 0; i < size; i++) {
          nums[i].numero = rb[i] & 0x40000000
               ? rb[i] | 0x7fffff00
               : rb[i] & 0xff;
          nums[i].validez = rb[i] >> 31;
     }
     suma = sumatoria_positivos(nums, size);
     suma_c = sumatoria_positivos_en_c (nums, size);
     printf("resultado asm:\t%x\n"
            "resultado c: \t%x \n",
            suma, suma_c);
}

void test_promedio (unsigned  * rb) {
     puts("promedio_negativos\n"
          "==================");
     float media, media_c = 0;
     
     numero * nums = malloc (4 * size);
     int i;
     
     for (i = 0; i < size; i++) {
          
          nums[i].numero = rb[i] >> 30 & 1
               ? rb[i] | 0x7fffff00
               : rb[i] & 0xff;
          nums[i].validez = rb[i] >> 31;
     }
     
     media = promedio_negativos(nums, size);
     media_c = promedio_negativos_c (nums, size);
     printf("resultado asm:\t%f\n"
            "resultado c: \t%f\n",
            media, media_c);

}

void test_extender_a_32(unsigned *rb) {
     puts("extender a 32");
     numero * nums = malloc (4 * size);
     uint32_t * extendidos;
     int i;
     for (i = 0; i < size; i++) {
          nums[i].numero = rb[i]  ;
          nums[i].validez = rb[i] >> 31;
          printf ("%x,%s",
                 nums[i].numero, (i+1) % colsize == 0 ? "\n" : " ");
     }
     /* puts("=============================="); */
     extender_a_32(nums, size);
     extendidos = (void*)nums;

     /* for (i = 0; i < size; i++) { */
     /*      printf("%x,%s", */
     /*             extendidos[i], (i+1) % colsize == 0 ? "\n" : " "); */
     /* } */
     /* puts(""); */
}

void test_extender_a_32_validos(unsigned *rb) {
     puts("extender a 32 validos\n"
          "=====================");
     numero * nums = malloc (4 * size);
     uint32_t * extendidos;
     int i;
     for (i = 0; i < size; i++) {
          nums[i].numero = rb[i]  ;
          nums[i].validez = rb[i] >> 31;
     /*      if (nums[i].validez) */
     /*        printf ("%8x,%s", */
     /*                nums[i].numero, (i+1) % colsize == 0 ? "\n" : " "); */
     /*      else */
     /*        printf ("inv     ,%s", */
     /*                (i+1) % colsize == 0 ? "\n" : " "); */

     }
     /* puts("=============================="); */
     extender_a_32_validos(nums, size);
     extendidos = (void*)nums;

     /* for (i = 0; i < size; i++) { */
     /*      printf("%8x,%s", */
     /*             extendidos[i], (i+1) % colsize == 0 ? "\n" : " "); */
     /* } */
     /* puts(""); */
 }

void test_ratio_pares_impares (unsigned *rb) {
     puts("ratio");
     float ratio, ratio_c = 0;
     int pares, impares; pares = impares = 0;
     numero * nums = malloc (4 * size);
     int i;
     
     for (i = 0; i < size; i++) {
          unsigned numero = rb[i] & 0xff; 
          nums[i].numero = numero & 0xff; 
          nums[i].validez = rb[i] >> 31;
          if (numero & 1)
               impares += numero;
          else
               pares += numero;
     }
     printf("resultado_c: %f\n",
            (float)pares/impares);
     ratio = ratio_pares_impares(nums, size);
     printf("resultado asm:\t%f\n", ratio);
  
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
     //unsigned * rb = nonrand_data (size<<4, 0xc0000001);
     test_sumatoria(rb);
     test_promedio(rb);
     test_extender_a_32_validos(rb);
     test_ratio_pares_impares(rb);


     unsigned x = -1;
}
