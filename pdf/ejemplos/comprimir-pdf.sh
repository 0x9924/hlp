#!/bin/bash
PDFSETTINGS="ebook"
OutFILE="output.pdf"

while true; do
    case "$1" in 
	-dPDFSETTINGS ) PDFSETTINGS="$2"; shift 2;;
	-sOutputFile ) OutFILE="$2"; shift 2;;
	* ) break;;
    esac
done

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/"$PDFSETTINGS" \
   -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$OutFILE" "$1"
