#!/bin/bash


if [ $# -eq 0 ]; then
    echo "not enough arguments provided"
    exit 1
fi

if [ $# -eq 1 ]; then
    DOMAIN=$1
    COPY=0
fi

if [ $# -eq 2 ]; then
    DOMAIN=$2
    COPY=1
fi

CODE=$(ykman oath code -s $DOMAIN)

if [ $COPY -eq "1" ]; then
    echo -n "$CODE" | xclip -selection clipboard
else
    echo "$CODE"
fi


