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

namespace fs = std::filesystem;

int main (int argc, char** argv) {
    auto root = fs::current_path();
    for(auto& p: fs::directory_iterator(root)) {
        
        std::cout << "---------------------- path:\n"
                  << p.path() << '\n'
                  <<"root_name():\t " << p.path().root_name() << '\n'
                  <<"relative_path():\t " << p.path().relative_path() << '\n'
                  <<"parent_path():\t " << p.path().parent_path() << '\n'

                  <<"string():\t " << p.path().string() << '\n'
                  <<"filename():\t " << p.path().filename() << '\n'
                  <<"stem():\t " << p.path().stem() << '\n'
            ;


    }
}
