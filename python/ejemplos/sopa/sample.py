#!/bin/env python3
import sys
import getopt
import random

def main(argv):
    n = 15

    try:
        opts, args = getopt.getopt(argv, "hn:")
    except:
        sys.exit(2)

    for o, a in opts:
        if o == "-h":
            usage()
            sys.exit(0)
        elif o == "-n":
            n = int(a)
        else:
            assert False, "unhandled option"

            
    with open(args[0], 'r') as f:
        pals = f.read()
        pals = pals.split()
        n = min(n, len(pals))
        pals = random.sample(pals, n)
        print(" ".join(pals))

def usage():
    msg = "uso: sample [-n NUMERO] ARCHIVO\n\n" \
          + "\t-n es el numero de palabras a samplear.\n" \
          + "\t   El valor por defecto es 15.\n" \
          + "\tEl ARCHIVO debe contener un conjunto de palabras."
    print(msg)
    
if __name__ == "__main__":
    main(sys.argv[1:])
