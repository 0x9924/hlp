#include <string>
#include <iostream>

using namespace std;

int main () {
     string line;
     cout << "Escriba lineas. Para salir C-d." << endl;
     while (getline(cin, line)) {

          cout << line << endl;
     }

     return 0;
}
