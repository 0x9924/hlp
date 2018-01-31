#!/bin/bash
FILENAME=${1}
if [[ -f ${FILENAME} ]]
then
    emacs $FILENAME --batch -f org-html-export-to-html --kill
else
    echo No existe el archivo \"${FILENAME}\"
fi
