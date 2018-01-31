
bool mismos(const int arreglo1[], const int arreglo2[],
	    unsigned int longitud1, unsigned int longitud2)
{
   if( longitud1 != longitud2 )
      return false;
   for(unsigned int i = 0; i < longitud1; i++)
   {
      if(cuenta(arreglo1[i], arreglo2, longitud1) != cuenta(arreglo1[i], arreglo1, longitud1))
	 return false;
   }
   return true;
}
