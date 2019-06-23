template<int N>
struct FiboRec {
    static long unsigned const second = FiboRec<N-2>::first + FiboRec<N-2>::second;
    static long unsigned const first = second + FiboRec<N-2>::first;
};


template<>
struct FiboRec<1> {
    static long unsigned const second = 0;
    static long unsigned const first = 1;
};

template<>
struct FiboRec<2> {
    static long unsigned const second = 1;
    static long unsigned const first = 1;
};
template<int N>
struct Fibonacci {
    static long unsigned const value = FiboRec<N>::first;
};

int main () { long unsigned fibo { Fibonacci<25>::value}; }
