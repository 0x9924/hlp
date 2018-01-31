#!/usr/bin/awk -f


BEGIN {
    print "hello (press C-d to END)"
    print ARGV[1];
    ARGC = 0;
}

{
    print $0
}

END { print "world" }
