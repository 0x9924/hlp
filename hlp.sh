#!/bin/bash

hlpdir=${HOME}/hlp

hlp () {
    if [ $# -eq 0 ]; then
        echo "hlp [opcion] OPTARG STR"
        printf "  -i \t para grep -r --include=\"*.OPTARG\" .\n"
        printf "  -o \t para find OPRARG-h.org.\n"
        printf "   sin opción: equivalente a hlp -i org STR\n"
        return 0
    fi

    HLP_CMD=grep
    HLP_EXT="-h.org"
    while getopts ":o:i:" OPT; do
        case $OPT in
            o) HLP_CMD=find; HLP_QUERY=$OPTARG
               ;;
            i) HLP_CMD=grep; HLP_EXT=$OPTARG
               ;;
            \?) echo "Opcion inválida: -$OPTARG." >&2
                ;;
            :) echo "La opcion $OPTARG requiere un argumento." >&2
               ;;
        esac
    done
    shift $(($OPTIND - 1));  OPTIND=1


    case $HLP_CMD in
        find) find ${hlpdir} -type f -name "$HLP_QUERY*-h.org" -exec cat {} \;
              ;;
        grep) echo busco en archivos \*$HLP_EXT
              grep --color=always -r --include="*$HLP_EXT" "${*}" ${hlpdir} |
                   tr -s \| "\n"
              ;;
    esac

}

<<<<<<< HEAD
=======
alias gmail="emacs -nw --eval '(gnus-gmail)'"
alias emq="emacs -nw -Q"
>>>>>>> 11eb1457a2995ee7ddb5079045fa8be8bc23dffe
