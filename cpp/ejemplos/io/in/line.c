#include <string>
#include <iostream>

using namespace std;

int main () {
     string line;
     cout << "Escriba una lineas Luego RET." << endl;
     getline(cin, line);
     for (char c : line) {
          cout << "char: " << c << endl;
     }

     
     return 0;
}
