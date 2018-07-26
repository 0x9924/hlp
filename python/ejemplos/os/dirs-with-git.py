#!/bin/python3

import os
def main():
    dirpath = os.getcwd()
    path = os.listdir(dirpath)
    subdirs = [d for d in path if not
               os.path.isfile(os.path.join(dirpath, d))]

    for d in subdirs:
        if ".git" in os.listdir(os.path.join(dirpath, d)):
            print(d)
    
if __name__ == "__main__":
    main()
