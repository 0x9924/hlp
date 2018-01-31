#!/bin/bash

getopts_ej () {
    while getopts ":a:" opt; do
        case $opt in
            a)
                echo "-a was triggered, Parameter: $OPTARG" >&2
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                OPTIND=1
                return 1
                ;;
            :)
                echo "Option -$OPTARG requires an argument." >&2
                OPTIND=1
                return 1
                ;;
        esac
    done
    OPTIND=1
}
