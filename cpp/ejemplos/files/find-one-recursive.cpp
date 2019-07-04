// Shows one file with pro
// Compile using:
// g++ FILENAME -std=c++17 lstdc++fs

#include <iostream>
#include <string>
#include <vector>
#include <random>
#include <filesystem>
#include <algorithm>
#include <iterator>

std::random_device rd;
std::mt19937 rng(rd());

namespace fs = std::filesystem;

int main (int argc, char** argv) {
    
    auto root = fs::current_path();
    auto it = fs::recursive_directory_iterator(root);

    long int distance {
        std::distance(fs::recursive_directory_iterator(root),
                      fs::recursive_directory_iterator{})
    };

    std::uniform_int_distribution<long> uni(0, distance - 1);
    long i{uni(rng)};
    std::advance(it, i);

    std::cout << it->path() << std::endl;
}
