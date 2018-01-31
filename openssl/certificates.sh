#!/bin/bash

SERVER=${1}

echo | openssl s_client -showcerts -servername ${SERVER} \
               -connect ${SERVER}:443 2> /dev/null \
               | openssl x509 -inform pem -noout -text
