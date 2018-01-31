#include <iostream>
#include <limits>

int main()
{

   std::cout << "\t\t" << "min\t" << " max\n";
 
   char a, b;
   a = 0;
   b = a++;
   while(a > b){ ++a; ++b;}
   std::cout << "char\t\t" << int(a) << "\t" << int(b) << "\n";

   short int i, j;
   i = 0; 
   j = i++;
   while(i > j){ ++i; ++j;}
   std::cout << "short int\t" << i << "\t" << j << "\n";

   int k, l;
   k = 0; 
   l = k++;
   while(k > l){ ++k; ++l;}
   std::cout << "int\t\t" << k << "\t" << l << "\n";
 
   float f, g;
   f = 0; 
   g = f++;
   while(f > g){ ++f; ++g;}
   std::cout << "float\t\t" << f << "\t" << g << "\n";

   // estos q siguen tardan mucho...

   long int m, n;
   m = 0; 
   n = m++;
   while(i > j){ ++m; ++n;}
   std::cout << "long int\t" << m << "\t" << n << "\n";

   double d, e;
   d = 0; 
   e = d++;
   while(d > e){ ++d; ++e;}
   std::cout << "double\t" << d << "\t" << e << "\n";

   long double p, q;
   p = 0; 
   q = d++;
   while(d > e){ ++d; ++e;}
   std::cout << "l double\t " << p << "\t" << q << "\n";

}

