#include <iostream>
#include <fstream>


void print_tokens(char * filename) {
    std::ifstream file(filename);
    std::string token;
    while (file >> token) {
        std::cout << "____:" << token << ":____" << std::endl;
    }
}


int main(int argc, char** argv) {
    for (int i = 1; i < argc; i++) {
        print_tokens(argv[i]);
    }
    return 0;
}
