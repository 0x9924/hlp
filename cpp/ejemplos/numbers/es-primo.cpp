bool esPrimo(int numero)
{
   if (numero < 2)
      return false;

   for(int i = 2; i < numero; i++)
      if( numero % i == 0)
	 return false;
   return true;
}
