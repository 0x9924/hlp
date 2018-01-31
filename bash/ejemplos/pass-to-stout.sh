#!/usr/bin/bash

stty_orig=$(stty -g)

stty -echo
echo Choose pass:
read pass
stty $stty_orig
printf $pass

