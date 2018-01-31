#include <stdio.h>


extern float addfl (float, float);

int main () {
  printf ("en c 2.3 + 7.6: %f", 2.3 + 7.6);
  printf ("en asm addfl: 5.1 + 8.21: %f\n", addfl (5, 8.21));

  return 0;
}
