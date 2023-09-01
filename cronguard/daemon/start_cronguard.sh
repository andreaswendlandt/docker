#!/bin/bash

./opt/cronguard/cronguard.sh start >>/var/log/cronguard.log

while true; do
    sleep 5
done
