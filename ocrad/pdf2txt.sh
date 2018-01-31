#!/bin/bash
PDFFILE=${1}
if [[ -z  ${PDFFILE} ]]
then
    echo Debe decir el archivo
else
    gs -sPAPERSIZE=a4 -sDEVICE=pnmraw -r300 -dNOPAUSE -dBATCH \
       -sOutputFile=- -q ${PDFFILE} \
        | ocrad
fi
