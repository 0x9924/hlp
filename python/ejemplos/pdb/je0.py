# $ python3
# $ import je0
# $ je0.foo()

import pdb

def foo():
    for i in range(100):
        print(i)
        if i == 50:
            pdb.set_trace()
