void sexta () {}

void quinta () { sexta (); }

void cuarta () { quinta (); }
     
void tercera () { cuarta (); }

void segunda () { tercera (); }

void primera () { segunda (); }

int main () {
     primera ();
     return 0;
}


