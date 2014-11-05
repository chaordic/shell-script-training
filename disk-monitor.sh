#!/bin/bash

# qual a maior utilização de um disco
DISK_USAGE_MAX=$(df | tail -n +2 | awk '{print $5}' | cut -d'%' -f1 | sort | tail -1)

echo $DISK_USAGE_MAX
# maiores arquivos de log
du -a /var/log | sort -nr | head -n 10 2> /dev/null
# arquivos de log mais antigos que 30 dias
find /var/log -atime +30 2> /dev/null
