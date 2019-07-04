#!/bin/bash

# shopt -s extglob nullglob
subdirs=(~/*/)

for dir in ${subdirs[@]}; do
    echo $dir
done
