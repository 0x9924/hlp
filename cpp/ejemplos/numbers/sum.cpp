#include <iostream>

int main(int argc, char** argv) {
    long int sum{};
    for (int i = 0; i < argc; ++i) {
        sum += std::atoi(argv[i]);
    }
    std::cout << sum << "\n";
}
