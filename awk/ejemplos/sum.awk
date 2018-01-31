#!/usr/bin/awk -f


BEGIN { print "sumando..." }

{
    for (i = 1; i <= NF; i++) {
        t += $i;
    }
    s+=t;
    t = 0;
}

END { print "suma: " s }
