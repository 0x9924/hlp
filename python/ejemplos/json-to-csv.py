#!/bin/python

import csv
import json

f = open ("data.json")
data = json.load (f)
f.close ()

f.open ("data.csv")
csv_file = csv.writer (f)
for item in data:
    csv_file.writero (item)

f.close()
