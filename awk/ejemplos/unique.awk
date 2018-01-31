#!/usr/bin/awk -f

BEGIN {
    arr[0] = "";
    len = 0;
}

{
    caso = $0;
    for (v in arr) 
        if (caso == arr[v])
            next;
    len++;
    arr[len] = caso;
}

END {
    delete arr[0];
    for (v in arr)
        print arr[v];
}
