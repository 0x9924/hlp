#!/bin/bash

# Assuming lan is from 192.168.0.1 to
# 192.168.0.255. Use ./get-lan-range.sh
# if not


nip=192.168.0

for ip in {1..254}
do
    timeout 0.011 ping -i 0.2 -c1 $nip.$ip >/dev/null
   [ $? -eq 0 ] && echo "192.168.0.$ip UP" || :
done
 
