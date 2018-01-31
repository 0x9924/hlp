#include <iostream>
#include <vector>
using namespace std;

ostream &operator<<(ostream &os, const vector<int> a);
void swap(vector<int> &a, int n, int m);
void upsort(vector<int> &a);
void selection_sort(vector<int> &a);   

int main ()
{
   int a[] = { 18,12, 7, 1, 5, 6 , 60, 9, -9 };
   int n = sizeof(a)/sizeof(*a);

   vector<int> v(a, a + n); 

   cout << v << endl;
   //upsort(v);
   selection_sort(v);
   cout << v << endl;
   
}

void selection_sort(vector<int> &a)
{
   int i = 0, n = a.size();
   int j;
   while ( i < n )
   {
      j = i;
      while ( j > 0 && a[j - 1] > a[j])
      {
	 swap(a, j, j - 1);
	 j--;
      }
      i++;
   }
}
void upsort(vector<int> &a)
{
   int i = 0, n = a.size();
   int j, min_idx;
   while ( i < n )
   {
      j = i; min_idx = i;
      while ( j < n )
      {
	 if ( a[min_idx] > a[j])
	    min_idx = j;
	 j++;
      }
      if (i != min_idx)
	 swap(a, i, min_idx);
      i++;
   }
   return;
}

void swap(vector<int> &a, int n, int m)
{
   int tmp = a[n];
   a[n] = a[m];
   a[m] = tmp;
}
ostream &operator<<(ostream &os, const vector<int> a){

   int i = 0;
   int n = a.size();

   os << '[';
   while (i < n)
   {
      os << ' ' << a[i];
      i++;
   }
   os << " ]";
   return os;
}
