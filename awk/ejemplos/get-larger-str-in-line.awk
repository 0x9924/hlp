#!/usr/bin/awk -f

 BEGIN {
     max=0
 }

 length($1) > max 
 {
     max=length($1)
 }                             

 END {
     print max
 } 

    

