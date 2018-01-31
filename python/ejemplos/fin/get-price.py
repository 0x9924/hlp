#! /usr/bin/env python

##http://www.google.com/finance/info?infotype=infoquoteall&q=NASDAQ:AAPL

import sys, getopt
import requests, json

ejemplo = ['AAPL', 'FRAN', 'GGAL', 'TECO2', 'YPFD']

def main(argv):

    mkt='BCBA'

    try:opts, args = getopt.getopt(sys.argv[1:], "m:", ["market="])
    except getopt.GetoptError as err:
        print(str(err)) 
        sys.exit(2)

    for opt, arg in opts:
        if opt == "-m":
            mkt=arg

    if args == []: args = ejemplo
    for stock in args:
        print_price_google("{}:{}".format(mkt, stock))

def print_price_google(ticker):
    url = 'http://www.google.com/finance/info'
    pars = {
        'infotype': 'infoquoteall',
        'q': ticker
        }
    
    try:
        r = requests.get(url, params=pars)
    except getopt.GetoptError:
        print('get-price NAME [NAME ...]')
        sys.exit(2)

    data=json.loads(r.content[5:-2])
    print("{}:{:4}\t{}".format(data['e'], data['t'], data['l']))
    
    
if __name__ == "__main__":
    main(sys.argv[1:])
