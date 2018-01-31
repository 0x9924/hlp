# -*- mode:shell-script -*-
#!/usr/bin/

gpgfiles () {
    stty_orig=$(stty -g)

    stty -echo
    echo Choose pass:
    read pass

    for f in *
    do
	echo ${pass} | \
	    gpg --passphrase-fd 0 --batch -d --output tmp/${f}.ext ${f}

    done
    stty $stty_orig


}
