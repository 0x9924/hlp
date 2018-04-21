#include <unistd.h>


int main(int argc, char** argv) {
     char* msg = "Hola!\n";
     write(1, msg, sizeof(msg));
}
