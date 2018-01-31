import ctypes

class bits():
    def __init__(self, nbits, initnum):
        if nbits < 1:
            raise ValueError("n debe ser positivo")
        self.n = nbits
        self.b = [1 & initnum >> x for x in range(nbits)]
        
def bitsRange(n, desde, hasta):
    if hasta > 32 or hasta > 32 or hasta < 0 or desde < 0:
        raise ValueError("Bit fuera de rango")
    return hex((n >> desde) & ((1 << hasta - desde) - 1))


class Descriptor32:
    def __init__(self, n):
        if n < 0 or n > 0xFFFFFFFF:
            raise ValueError("n debe ser de 32 bits")
        self.n = n
    def brange(desde, hasta):
        if hasta > 32 or hasta > 32 or hasta < 0 or desde < 0:
            raise ValueError("Bit fuera de rango")
        return hex((n >> desde) & ((1 << hasta - desde) - 1))
    def hex(self):
        return hex(self.n)
    def setbrange(desde, hasta, num):
        mask = (1 << (hasta - desde) + 1) - 1
        if num > mask or num < 0:
            raise ValueError("valor de num muy grande")
        mask2 = ~(mask << desde)

        

class SegmentSelector(Descriptor32):
    # def __init__(self, n):
    #     Descriptor32.__init__(self, n)
    #     self.index = self.n >> 3
    def index(self, i):
        self.n 
    def index(self):
        return hex(self.n >> 3)
    def ti(self):
        return (self.n & 4) >> 2
    def rpl(self):
        return (self.n & 3)
    
class SegmentDescriptor(Descriptor32):
    def l(self):
        return hex( (self.n >> 21) & 1)
    def avl(self):
        return hex((self.n >> 20) & 1)
    def base(self):
        low = self.n & 0xFF
        high = (self.n >> 16 ) & 0xF00
        return hex(low | high)
    def db(self):
        return hex((self.n >> 22) & 1)
    def dpl(self):
        return hex((self.n >> 12) & 3)
    def g(self):
        return hex((self.n >>23) & 1)

    def limit(self):
        return hex(self.brange(16,19) )
