#include <stdio.h>

long bitsInLong();
long bytesInLong();

int main()
{
   long bits = bitsInLong();
   printf("La cantida de bits en un long es: %ld\n", bits);
   long l = 0x100;
   printf("0x100 es %ld\n", l);
   long bytes = bytesInLong();
   printf("La cantida de bytes en un long es: %ld\n", bytes);

   return 0;
}

long bitsInLong()
{
   unsigned long ul = 1;
   unsigned long bits = 0;
   while (ul) { bits++; ul <<= 1; }
   return bits;
}

long bytesInLong()
{
   unsigned long ul = 0x100;
   // asumo que tiene al menos un byte
   unsigned long bytes = 1;
   while (ul) { bytes++; ul <<= 8; }
   return bytes;
}
