#!/bin/bash

PREV_RX=$(/sbin/ifconfig $1 | grep "RX bytes" | cut -d: -f2 | awk '{ print $1 }')
PREV_TX=$(/sbin/ifconfig $1 | grep "TX bytes" | cut -d: -f3 | awk '{ print $1 }')

sleep 5

CURRENT_RX=$(/sbin/ifconfig $1 | grep "RX bytes" | cut -d: -f2 | awk '{ print $1 }')
CURRENT_TX=$(/sbin/ifconfig $1 | grep "TX bytes" | cut -d: -f3 | awk '{ print $1 }')

DELTA_RX=$(( $CURRENT_RX - $PREV_RX ))
DELTA_TX=$(( $CURRENT_TX - $PREV_TX ))

RX_PER_SEC=$(( $DELTA_RX / 5 ))
TX_PER_SEC=$(( $DELTA_TX / 5 ))

# in e out de rede nos ultimos 5 segundos
echo $RX_PER_SEC
echo $TX_PER_SEC
