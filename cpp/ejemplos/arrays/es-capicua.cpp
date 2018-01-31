
bool esCapicua(string palabra)
{
   int len = palabra.length();
   for (int i = 0; i < len/2; i++)
      if( palabra.at(i) != palabra.at(len - 1 - i) )
	 return false;

   return true;
}

