# Hacking Google Finance in Real-Time for Algorithmic Traders
# 
# (c) 2014 QuantAtRisk.com, by Pawel Lachowicz
 
import urllib, time, os, re, csv
 
def fetchGF(googleticker):
    url="http://www.google.com/finance?&q="
    txt=urllib.urlopen(url+googleticker).read()
    k=re.search('id="ref_(.*?)">(.*?)<',txt)
    if k:
        tmp=k.group(2)
        q=tmp.replace(',','')
    else:
        q="Nothing found for: "+googleticker
    return q

# display time corresponding to your location
print(time.ctime())
print
 
# Set local time zone to NYC
os.environ['TZ']='America/New_York'
time.tzset()
t=time.localtime() # string
print(time.ctime())
print

def combine(ticker):
    quote=fetchGF(ticker) # use the core-engine function
    t=time.localtime()    # grasp the moment of time
    output=[t.tm_year,t.tm_mon,t.tm_mday,t.tm_hour,  # build a list
            t.tm_min,t.tm_sec,ticker,quote]
    return output

ticker="NASDAQ:AAPL"

# define file name of the output record
fname="aapl.dat"
# remove a file, if exist
os.path.exists(fname) and os.remove(fname)
