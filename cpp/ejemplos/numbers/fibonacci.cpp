#include <utility>
#include <cassert>

long unsigned fibonacci(const unsigned k)
{
    if( k == 0) { return 0; }
    if( k == 1) { return 1; }
    long unsigned anteultimo = 0;
    long unsigned ultimo = 1;
    long unsigned tmp;
    
   for (unsigned i = 2; i <= k; i++)
   {
      tmp = ultimo;
      ultimo += anteultimo;
      assert (tmp <= ultimo);
      anteultimo = tmp;
   }
   return ultimo;
}



long unsigned  fibonacci_rec(const unsigned k) {
    if ( k < 2 ) { return k; }
    return fibonacci_rec (k-1) +  fibonacci_rec (k-2);
}

using fibonacci_pair_t = std::pair <long unsigned, long unsigned>;



fibonacci_pair_t fibonacci_rec_din_pair(const unsigned k) {
    if ( k == 1 ) { // f1 , f0
        return fibonacci_pair_t{1, 0};
    }
    if ( k == 2 ) { // f2, f1
        return fibonacci_pair_t{1, 1};
    }
    auto f_rec {fibonacci_rec_din_pair(k-2)};
    long unsigned k_3 { f_rec.second };
    long unsigned k_2 { f_rec.first };
    long unsigned k_1 { k_2 + k_3 };
    long unsigned k_0 { k_1 + k_2 };

    return fibonacci_pair_t { k_0, k_1 };
}


long unsigned  fibonacci_rec_din(const unsigned k) {
    auto res = fibonacci_rec_din_pair (k);
    return res.first;
        
}
