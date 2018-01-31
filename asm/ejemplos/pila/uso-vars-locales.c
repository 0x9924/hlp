#include <stdio.h>


extern void var_locales (int, int, int, int, int);

int main () {
    int x, y, z, v, w;
    x = 2; y = 3; z = 5; v = 7; w = 11;
    var_locales (x, y, z, v, w);
    return 0;
}
