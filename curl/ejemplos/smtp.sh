#!/bin/bash

if [ $# -ne 3 ]; then
    echo uso:
    echo ./$0 SERVER RCTP FILE
    exit
fi

SERVER=$1
RCPT=$2
FILE=$3

echo username:
read USER
echo password:
read -s PASS
echo sending $FILE from $USER@$SERVER to $RCPT
curl --url "smtps://smtp.gmail.com:465" --ssl-reqd \
  --mail-from "$USER@SERVER" --mail-rcpt "$RCPT" \
  --upload-file $FILE --user "$USER@$SERVER:$PASS"
