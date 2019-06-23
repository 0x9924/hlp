#include <iostream>
#include <vector>

#include <armadillo>

int main(int argc, const char **argv) {

    std::vector<double> vector{1,1,1,1,1,1,1,1,1};
    arma::Mat<double> A(vector.data(), 3, 3);
    std::move(vector);
    arma::Mat<double> AtA{A * A.t()};
    
    std::cout << "A:" << std::endl;
    std::cout << A << std::endl;

    std::cout << "A^t A:" << std::endl;
    std::cout << AtA << std::endl;

    std::cout << "chol(A^tA):" << std::endl;
    std::cout << chol(AtA) << std::endl;
    return 0;
}
