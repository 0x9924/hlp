
bool esPrefijo(const string prefijo, const string palabra)
{
   if (prefijo == "")
      return true;
   if (prefijo.length() > palabra.length())
      return false;
   int l = prefijo.length();
   for(int i = 0; i < l; i++)
   {
      if(prefijo.at(i) != palabra.at(i))
	 return false;
   }
   return true;
}

