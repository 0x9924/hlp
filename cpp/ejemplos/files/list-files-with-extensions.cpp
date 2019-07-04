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
#include <set>


namespace fs = std::filesystem;

int main (int argc, char** argv) {
    std::set<std::string> extensions(argv + 1, argv + argc);
    
    auto root = fs::current_path();
    for(auto& p: fs::directory_iterator(root)) {

        if (extensions.find(p.path().extension()) != extensions.end()) {
            std::cout << "string():\t " << p.path().string() << '\n'
                      <<"filename():\t " << p.path().filename() << '\n'
                      <<"extension():\t " << p.path().extension() << '\n'
                      <<"stem():\t\t " << p.path().stem() << "\n\n"
                ;
        }

    }
}
