# -*- mode:shell-script -*-
#!/usr/bin/

gpgdir () {
    FILENAME=${1}
    if [[ ! -e $FILENAME ]]; then
        echo NO EXISTE ${FILENAME}
    else
        stty_orig=$(stty -g)
        stty -echo
        echo Choose pass:
        read pass
        stty $stty_orig
        if [[ $FILENAME =~ \.gpg$ ]]; then
            TARFILE=${FILENAME//.gpg/}
            echo ${pass} \
                | gpg --passphrase-fd 0 --batch -d --output ${TARFILE} ${FILENAME}
            tar -xf ${TARFILE} \
                && rm ${TARFILE} ${FILENAME}
                
        else
            FILENAME=${FILENAME///}
            tar -cf ${FILENAME}.tar ${FILENAME} \
                && echo ${pass} \
                    | gpg --passphrase-fd 0 --batch -c ${FILENAME}.tar \
                          && rm -rf ${FILENAME} ${FILENAME}.tar
            
        fi
    fi

}
