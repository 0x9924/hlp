#include <iostream>
#include <chrono>
#include <functional>
#include <utility>
#include <cstdlib>

long unsigned fibonacci(const unsigned k);
long unsigned fibonacci_rec(const unsigned k);
long unsigned fibonacci_rec_din(const unsigned k);

std::pair<long unsigned, double>
time(std::function<long unsigned(void)> foo) {
    using namespace std::chrono;
    auto start = steady_clock::now();
    long unsigned res {foo()};
    auto end = steady_clock::now();
    return std::make_pair(
        res, duration <double, std::milli> (end - start).count()
        );
}


int main(int argc, char** argv) {

    for (int i = 1; i < argc; ++i) {
        unsigned n{static_cast<unsigned>(std::atoi(argv[i]))};
        auto f = time ([&n]() { return fibonacci(n);});
        auto f_rec_din = time ([&n]() { return fibonacci_rec_din(n);});
        
        std::cout << n << " " << f.first
                  << " " // << f.second << " "
                  << f_rec_din.first
                  << //" " << f_rec_din.second << 
                  std::endl;
        
    }
}
    
