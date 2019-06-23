#include <iostream>
#include <vector>

// mat := Mat<double>

#include <armadillo>

int main(int argc, const char **argv) {

    std::vector<double> vector{1,2,1,3.01,1,4,0.1,-1,-7.2};
    
    arma::mat A(vector.data(), 3, 3);
    std::move(vector);

    std::cout << "A:" << std::endl;
    std::cout << A << std::endl;

    arma::mat L, U, P;

    lu(L, U, P, A);

    std::cout << "L:" << std::endl;
    std::cout << L << std::endl;

    std::cout << "U:" << std::endl;
    std::cout << U << std::endl;

    std::cout << "P:" << std::endl;
    std::cout << P << std::endl;

    // arma::mat B = P.t()*L*U;
    // std::cout << B << std::endl;
    return 0;
}
