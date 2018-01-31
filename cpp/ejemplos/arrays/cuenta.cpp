
unsigned int cuenta(int e, const int a[], unsigned int l)
{
   unsigned int res = 0;
   for(unsigned int i = 0; i < l; i++)
   {
      if(a[i] == e)
	 res++;
   }
   return res;
}
