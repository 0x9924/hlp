#!/bin/bash

if [ $# -ne 1 ]; then
    echo uso:
    echo ./$0 SERVER 
    exit
fi

SERVER=$1

echo username:
read USER
echo password:
read -s PASS
#echo  $FILE from $USER@$SERVER to $RCPT
echo curl -D dump "imaps://$USER:$PASS@$SERVER"
curl -D dump "imaps://$USER:$PASS@$SERVER"

curl -D dump --url "imaps://imap.$SERVER" \
    --user "$USER:$PASS" \
