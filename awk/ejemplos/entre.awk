BEGIN {
    if (length(desde) == 0 || length(hasta) == 0) {
	print "uso:"
	print"    awk -f entre.awk -v desde=STR1 -v hasta=STR2 <FILE"
	exit 1;
    }
    imprimir = 0;
}
{
    if ( $0 ~ desde ) { imprimir++; }
    if ( imprimir ) { print $0 }
    if ( $0 ~ hasta ) { exit 0; }
}
END {}
