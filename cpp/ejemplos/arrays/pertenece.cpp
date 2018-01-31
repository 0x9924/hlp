
bool pertenece(int elemento, const int arreglo[], unsigned int longitud)
{
   for(unsigned int i = 0; i < longitud; i++)
      if (arreglo[i] == elemento)
	 return true;
   return false;
}
