#!/usr/bin/awk -f


BEGIN { print "hello (press C-d to END)" }

{
    print $0
}

END { print "world" }
