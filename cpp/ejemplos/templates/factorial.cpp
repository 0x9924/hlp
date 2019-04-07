template<int N>
struct Factorial {
    static long unsigned const value = N * Factorial<N-1>::value;
};


template<>
struct Factorial<1> {
    static long unsigned const value = 1;
};

int main () { long unsigned factorial {Factorial<20>::value}; }
