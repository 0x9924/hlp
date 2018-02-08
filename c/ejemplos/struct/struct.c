#include <stdio.h>

struct a_t {
  unsigned x: 16;
  unsigned y: 16;
};

int main () {
  printf("unsigned size: %lx\n", sizeof(unsigned));
  unsigned n = 0x1111FFFF;
  printf("n: %x\n", n);
  // esto no compila
  struct a_t a = (struct a) n;
}
  
