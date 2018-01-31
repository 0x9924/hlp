# -*- mode:shell-script -*-
#!/usr/bin/

decdir () {
    if [ -z $1 ]; then
	echo falta directorio destino
	return 1
    fi
    if [ -d $1 ]; then
	echo ya existe ${1}
	return 1
    fi
    mkdir ${1}
    stty_orig=$(stty -g)
    stty -echo
    echo Choose pass:
    read pass
    for f in *.gpg
    do
	fout=${f//.gpg/}
	echo ${pass} | \
	    gpg --passphrase-fd 0 --batch -d --output ${1}/${fout} ${f} #${f}
	if [ ! ${?} -eq 0 ]
	then
	    echo bk
	    break
	fi
    done
    stty $stty_orig
}
