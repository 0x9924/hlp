#!/bin/bash

DIR_CARTESIANO="/home/nsm/descartes" #${1}

while getopts "d:r" SWITCH ; do

    case $SWITCH in

        d)
            DIR_CARTESIANO=${OPTARG}
            ;;
    esac

done

shift $((OPTIND-1))

FILE_CANCION=${1}


if [[ ! -d "${DIR_CARTESIANO}" ]]
then
    >&2 echo "No existe ningun directorio ${DIR_CARTESIANO}"
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

echo "Borramos la cancion"
read -p "'${FILE_CANCION}'?(s/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[sS]$ ]]
    then
        echo "Movemos ${FILE_CANCION} a ${DIR_CARTESIANO}"
        mv "${FILE_CANCION}" "${DIR_CARTESIANO}"
fi



