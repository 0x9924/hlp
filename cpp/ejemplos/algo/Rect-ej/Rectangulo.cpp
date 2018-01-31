#include "Rectangulo.hpp"

algo2::Rectangulo::Rectangulo(const Par& origen, const Par& tamanio)
  : _origen(origen), _tamanio(tamanio) {}

const algo2::Par&
algo2::Rectangulo::origen() const
{
    return _origen;
}

const algo2::Par&
algo2::Rectangulo::tamanio() const
{
    return _tamanio;
}

float
algo2::Rectangulo::area()
{
    float ret = 1;
    return ret;
}
