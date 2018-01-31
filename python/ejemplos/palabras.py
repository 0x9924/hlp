#!/usr/bin/python3

import sys, getopt

def main(argv):
    # filename = sys.argv[-1]
    # argv = sys.argv[1:]
    try:
        opts, args = getopt.getopt(argv, 'h:w:')
    except getopt.GetoptError:
        print('palabras <filename>')
        sys.exit(2)

    head = None
    width = None
    
    for o, a in opts:
        if o == "-h":
            head = int(a)
            continue
        if o == "-w":
            width = int(a)
            continue

    diccionario = {}
    
    for archivo in args:
        with open(archivo, 'r') as f:
            string = f.read()
        strings = string.split()
        
        if width:
            strings = [x for x in strings if len(x) >= width]
        llenarTabla(diccionario, strings)

    tabla =  sorted(diccionario.items(), key=lambda x:x[1], reverse=True)
    tabla = tabla[: 1  and head or len(tabla)]
    ancho = max([len(x[0]) for x in tabla]) + 2
    print("\n".join(["%s %s" %
                     (x[0].ljust(ancho), x[1])
                     for x in tabla]))
        
def llenarTabla(tabla, pals):
    for p in pals:
        if p in tabla: tabla[p] += 1
        else: tabla[p] = 1


def enTuplas(tabla):
    sorted(tabla.items(), key=lambda x:x[1], reverse=False)

def enOrden(dicc):
    sorted(dicc, key=dicc.get)


if __name__ == "__main__":
    print(":::")
    main(sys.argv[1:])
    
