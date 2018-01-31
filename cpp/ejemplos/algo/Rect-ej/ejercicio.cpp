#include "Rectangulo.hpp"
#include <iostream>


std::ostream& operator << (std::ostream& os, const algo2::Par& p)
{
    os << "( " << p . x << ", " << p . y << " )";
    return os;
}
std::ostream& operator << (std::ostream& os, const algo2::Rectangulo& r)
{
    os << "Un rectangulo:" << std::endl
       << "\torigen: " << r.origen() << std::endl
       << "\ttanan_io: " << r.tamanio() << std::endl;
    return os;
}


int main()
{

  algo2::Par p1(0,0);
  algo2::Par p2(5,5);

  algo2::Rectangulo r1(algo2::Par(0, 0), algo2::Par(5, 5));
  algo2::Rectangulo r2(algo2::Par(5, 5), algo2::Par(8, 8));

  std::cout << "r1: " << r1 << std::endl;
  std::cout << "origen r1: " << r1.origen() << std::endl;
  std::cout << "area r1: " << r1.area() << std::endl;

  std::cout << "r2: " << r2 << std::endl;
  std::cout << "origen r2: " << r2.origen() << std::endl;
  std::cout << "area r2: " << r2.area() << std::endl;
}
