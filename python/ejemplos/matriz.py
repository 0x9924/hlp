class Matriz:
    def __init__(self, nfilas, ncols):
        self.lista = [None] * ( nfilas * ncols)
        self.nfilas = nfilas
        self.ncols = ncols
        
    def at(self, fila, colu):
        ## zero indexed
        if fila >= self.nfilas or colu >= self.ncols:
            return "error indice incorecto"
        return self.lista[ self.nfilas * fila + colu ]

    def llenarConLista(self, lista):
        self.lista[:len(lista)] = lista

x = [1,2,3,4,5,6,7,8,9]
