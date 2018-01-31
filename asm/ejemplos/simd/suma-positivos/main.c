#include <stdio.h>
#include "../../../../c/ejemplos/rand/random-bytes.h"

#define len(A) (sizeof(A)/(sizeof(*A))

long suma_positivos (char * nums, unsigned short n);
//const unsigned short size = 16 * 1000 ;
const unsigned short size = 16 * 100 ;

int main () {
     char * nums = random_bytes(size);
     
     long res_c, res_asm;
     res_asm = suma_positivos (nums , size);

     res_c = 0;
     for (unsigned short i = 0; i < size; i++) {
          if (nums[i] > 0) {
               unsigned rc = res_c & 0xffff;
               unsigned ni = nums[i] & 0x7f;
               unsigned rc_ni = rc + ni;
               if ( rc_ni & 0x10000) {
                    fprintf(stderr,
                            "ov.\n"
                            "rc : %x\n"
                            "ni: %x\n"
                            "rc + ni: %x\n",
                            rc, ni, rc_ni);
                    return 0;
               }
               res_c += (long)nums[i];
          }
     }
     if (res_asm != res_c) {
          puts("suma positivos. error");

          printf ("suma simd: %ld\t", res_asm);
          printf ("suma c: %ld\n", res_c);
          return 1;
     }
}
