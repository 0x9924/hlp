#!/bin/bash
conditions=3
test=0
while [[ $test -lt $conditions ]]; do
    test=0
    newpw=$(head /dev/urandom | tr -cd '0-9a-zA-Z,./;' |head -c8)
    if [[ $newpw =~ [0-9] ]];then  ((test++)); fi
    if [[ $newpw =~ [a-z] ]];then  ((test++)); fi
    if [[ $newpw =~ [A-Z] ]];then  ((test++)); fi
done

echo $newpw
