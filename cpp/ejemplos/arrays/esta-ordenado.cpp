bool estaOrdenado(const int arreglo[], unsigned int longitud)
{
   if(longitud == 0)
      return true;
   int c = 0;
   for (unsigned int i = 1; i < longitud; i++)
   {
      if( arreglo[i -1] <= arreglo[i] )
	 c--;
      else
	 c++;
   }
   return abs(c) == (int) longitud - 1;
}
