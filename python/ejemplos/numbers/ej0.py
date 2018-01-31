import math
a = math.exp(-2.5)
f = math.factorial

def sumaHasta(n):
    acum = 0
    i = 0
    while (i < n):
        acum += ( 2.5**i * a ) / f(i)
        i += 1
    return acum

def st(k):
    return (2.5**k)/f(k)
