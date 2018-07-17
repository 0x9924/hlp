#include <stdint.h>
#include <stdio.h>

int32_t fitness_diff (int32_t ind, int32_t o) {
     int32_t diff = ind - o;
     int32_t ret = diff < 0 ? -diff : diff;
     return ret;
}

int32_t fitness_bits (int32_t ind, int32_t o) {
    int32_t c = 0;
    uint32_t xnor = ~(ind ^ o);
    //printf("ind: %x\t o: %x\t xnor: %x\n", ind, o, xnor);
    while(xnor) {
         //printf("%x\t", xnor);//puts(".");
        if (xnor & 1)
            c++;
        xnor >>= 1;
    }
    return c;
}
