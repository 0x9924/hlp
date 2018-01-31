#include <iostream>
void swap ( int &a, int &b);
using namespace  std;

int main(int argc, char **argv )
{
   cout << "swap.cpp" << endl;
   int a,b;
   a = 1; b = 2;
   cout << "a: " << a << " b: " << b << endl;
   swap (a, b);
   cout << "a: " << a << " b: " << b << endl;

   cout << "=================================" << endl;

   int ar[10] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
   for (a = 0; a < 10; a++)
      cout << ar[a] ;
   cout << endl;
   
   for (a=0; a < 5; a++)
      swap (ar[a*2], ar[a*2+1]);

   for (a = 0; a < 10; a++)
      cout << ar[a] ;
   cout << endl;


   return 0;
}

void swap ( int &a, int &b )
{
   int tmp = a;
   a = b;
   b = tmp;
}
