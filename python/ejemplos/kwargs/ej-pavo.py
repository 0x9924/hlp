#!/bin/env python3

import sys

def foo(**kwargs):
    for k,v in kwargs.items():
        print("k: {} v: {}".format(k,v))


if __name__ == "__main__":
    args = {}
    for i,a in enumerate(sys.argv):
        args[a] = i

    foo(**args)
