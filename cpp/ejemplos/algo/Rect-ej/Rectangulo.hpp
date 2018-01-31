#ifndef RECTANGULO_HPP_
#define RECTANGULO_HPP_

#include "Par.hpp"
#include <iostream>

namespace algo2
{

class Rectangulo
{
  public:

    Par _origen;
    Par _tamanio;
  
    Rectangulo(const Par& origen, const Par& tamanio);

    const Par& origen() const; 

    const Par& tamanio() const;

    float area();
};

} // algo2

#endif // RECTANGULO_HPP_
