#!/bin/bash

DIR_COPIA=${1}
FILE_CANCION=${2}

if [[ ! -d "${DIR_COPIA}" ]]
then
    >&2 echo "No existe ningun directorio ${DIR_COPIA}"
    exit 1
fi

# Me fijo la extension
echo "${FILE_CANCION}" | grep "[mM][pP]3$\|[wW][mM][aA]$"

if [[ "$?" -ne 0 ]]
then
    echo "El arcivo ${FILE_CANCION} no tiene la extension requerida."
    exit 0
fi

read -p "Copiamos ${FILE_CANCION}?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[sS]$ ]]
    then
        echo ok
	cp "${FILE_CANCION}" ${DIR_COPIA}
fi
