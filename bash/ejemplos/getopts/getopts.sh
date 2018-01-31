#! /bin/bash

optA="defaultA"
optB="defaultB"
optC="defaultC"

while getopts :a:bc: SWITCH ; do

    case $SWITCH in

        a) echo opcion a
           optA=$OPTARG
           ;;

        b) echo opcion b
            optB=b
            ;;

        c) echo opcion c
            optC=$OPTARG
            ;;
    esac

done

echo optA es $optA
echo optB es $optB
echo optC es $optC
