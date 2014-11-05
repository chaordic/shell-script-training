#!/bin/bash

THRESHOLD=$1

# alertar quando consumo de cpu está acima de um limite
while :; do
    CPU_IDLE=$(vmstat 1 2 | tail -1 | awk '{print $15}')
    if [[ $(( 100 - $CPU_IDLE )) -gt $THRESHOLD ]]; then
        echo $CPU_IDLE
    fi

    sleep 5
done
