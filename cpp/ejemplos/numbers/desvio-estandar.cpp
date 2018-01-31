#include <math.h>


float desvioEstandar(const float arreglo[], unsigned int longitud)
{
   float suma = 0;
   for(unsigned int i = 0; i< longitud; i++)
   {
      suma += arreglo[i];
   }
   float  media =  suma/longitud;

   float cuadrados = 0;

   for(unsigned int i = 0; i < longitud; i++)
   {
      cuadrados += pow(arreglo[i] - media, 2);
   }
   float var = cuadrados/longitud;
   return(pow(var,0.5));
}
