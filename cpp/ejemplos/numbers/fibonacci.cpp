
long  fibonacci(int k)
{
   if( k == 0)
      return 0;
   long anteultimo = 1;
   long ultimo = 1;
   long tmp;

   for (int i = 2; i < k; i++)
   {
      tmp = ultimo;
      ultimo += anteultimo;
      anteultimo = tmp;
   }
   return ultimo;
}
