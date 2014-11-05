#!/bin/bash

THRESHOLD=$1

# memoria livre abaixo de um limite
while :; do
    FREE_MEM_FIELDS=$(vmstat -S M 1 2 | tail -1 | awk '{print $4,$5,$6}')
    IFS=' ' read -a FIELDS <<< "$FREE_MEM_FIELDS"
    FREE_MEM=$(( ${FIELDS[0]} + ${FIELDS[1]} + ${FIELDS[2]} )) 
    if [[ $FREE_MEM -lt $1 ]]; then
        echo $FREE_MEM
    fi

    sleep 5
done
