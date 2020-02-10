#include <fstream>
#include <cstdlib>
#include <numeric>
#include <vector>
#include <type_traits>
#include <iostream>


int main (int argc, char* argv[]) {

    if (argc < 3) { std::cout << "File NUM ...\n" ;std::exit(1);}

    std::ofstream ofs{argv[1] , std::ios::binary};
    
    for (int i = 2; i < argc; ++i) {
        auto n = std::strtoull(argv[i], nullptr, 10);
        using ValueType = std::remove_const_t<decltype(n)>;
        std::vector<ValueType> x(n);
        std::iota(x.begin(), x.end(), 0);

        ofs.write(reinterpret_cast<char*>(x.data()), x.size());

    }



}
