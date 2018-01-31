#!/bin/bash

git_rm_hist () {
    if [ ! -e ${1} ]
    then
	echo "Falta un parametro o no es un archivo"
	return 0
    fi
    
    if [ -d ${1} ]
    then GIT_RM_CACHED="git rm -r --cached --ignore-unmatch "${1}
    else if [ -d ${1} ]
	 then GIT_RM_CACHED="git rm --cached --ignore-unmatch "${1}
	 fi
    fi
    git filter-branch --force --index-filter "${GIT_RM_CACHED}" \
	--prune-empty --tag-name-filter cat -- --all && \
	echo "git push origin --force --all"
}
