#include <iostream>
#include <armadillo>

int main(int argc, const char **argv) {

    arma::arma_rng::set_seed_random();
    arma::Mat<double> A{arma::randu(5,5)};
    arma::Mat<double> AtA{A * A.t()};
    
    std::cout << "A:" << std::endl;
    std::cout << A << std::endl;

    std::cout << "A^t A:" << std::endl;
    std::cout << AtA << std::endl;

    std::cout << "chol(A^tA):" << std::endl;
    std::cout << chol(AtA) << std::endl;
    return 0;
}
