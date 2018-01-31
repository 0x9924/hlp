#!/usr/bin/

stty_orig=$(stty -g)

stty -echo
echo Choose pass:
read pass0
echo Repeat pass:
read pass1
if [[ "$pass0" == "$pass1" ]]
then
    echo "coinciden"
else
    echo "No coinciden"
fi
stty $stty_orig


