#!/usr/bin/

stty_orig=$(stty -g)

stty -echo
echo Choose pass:
read pass
stty $stty_orig
echo $pass

