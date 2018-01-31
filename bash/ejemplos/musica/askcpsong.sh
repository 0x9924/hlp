#!/bin/bash

DIR_COPIA="/home/nsm/descartes" #${1}

while getopts "d:r" SWITCH ; do

    case $SWITCH in

        d)
            DIR_COPIA=${OPTARG}
            ;;
    esac

done

shift $((OPTIND-1))

FILE_CANCION=${1}


if [[ ! -d "${DIR_COPIA}" ]]
then
    >&2 echo "No existe ningun directorio ${DIR_COPIA}"
    exit 1
fi

if [[ ! -f "${FILE_CANCION}" ]]
then
    >&2 echo "No existe el archivo ${FILE_CANCION}"
    exit 1
fi


# Me fijo la extension
echo "${FILE_CANCION}" | grep "[mM][pP]3$\|[wW][mM][aA]$"

if [[ $? -ne 0 ]]
then
    echo "El archivo '${FILE_CANCION}' no tiene la extension requerida."
    exit 0
fi

mplayer "${FILE_CANCION}"

echo "Copiamos la cancion"
read -p "'${FILE_CANCION}'?(s/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[sS]$ ]]
    then
        echo "Copiamos ${FILE_CANCION} a ${DIR_COPIA}"
        cp "${FILE_CANCION}" "${DIR_COPIA}"
fi



