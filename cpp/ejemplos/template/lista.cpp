#include <iostream>
#include "lista.hpp"

using namespace std;

int main () {
     Lista<int> l;
     l.agregar(1);
     l.agregar(7);
     for (int i = 0; i < 111; i++)
          l.agregar(i);
     
     Nodo<int> * n = l.head();

     for (int i = 0; i < l.size(); i++) {
          cout << n ->value() << " ";
          n = n -> next();
     }
     cout << endl;
     return 0;
}
