private uint mcd(uint u, uint v)
{
    int shift;

    // MCD(0,v) == v; MCD(u,0) == u, MCD(0,0) == 0 
    if (u == 0) return v;
    if (v == 0) return u;

    // obtengo shift: el maximo k tal que 2^k | v, 2^k | u. 
    for (shift = 0; ((u | v) & 1) == 0; ++shift)
    {
        u >>= 1;
        v >>= 1;
    }
    // divido u por 2 hasta que sea impar
    while ((u & 1) == 0)
        u >>= 1;

    do
    {
        // divido ahora v por 2 hasta que sea impar
        // Ya tengo en shift max k tq 2^k | mcd(u,v).
        //  vale: v != 0, o sea que while termina.
        while ((v & 1) == 0)
            v >>= 1;


        if (u > v)
        {   // swap
            uint t = v; v = u; u = t;
        }
        //vale: v >= u
        //      u | mcd
        v = v - u;
    } while (v != 0);

    // u * 2^k
    return u << shift;
}
