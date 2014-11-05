#!/bin/bash

# monit de processo
PROCESS_NAME=$1
COMMAND=$*

while :; do
    ps -e | grep $PROCESS_NAME > /dev/null
    GREP_RET=$?

    if [[ $GREP_RET -ne 0 ]]; then
        $COMMAND
    fi

    sleep 5
done
