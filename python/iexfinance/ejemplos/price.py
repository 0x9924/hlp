#!/usr/bin/env python3

import sys
from iexfinance import Stock

def main(argv):
    print("name\tprice\topen\tvariation")
    for n in argv:
        try:
            s = Stock(n)
            price = s.get_price()
            open = s.get_open()
            variation = 100 * (open - price)/ open
            print("{}\t{}\t{}\t{:.3f} %"
                  .format(n, price, open, variation))
        except:
            sys.stderr.write("error fetching data for '{}'\n"
                             .format(n))

if __name__ == "__main__":
    if len(sys.argv) == 1:
        print("usage {} [STOCK_NAME ...]".format(sys.argv[0]))
    else:
        main(sys.argv[1:])
