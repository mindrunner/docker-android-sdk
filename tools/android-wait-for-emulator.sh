#!/bin/bash

set +e

bootanim=""
failcounter=0
timeout_in_sec=9999999

until [[ "$bootanim" =~ "1" ]]; do
    bootanim=`adb -e shell getprop dev.bootcomplete 2>&1 &`
    if [[ "$bootanim" =~ "" ]]; then
        let "failcounter += 1"
        echo "Waiting for emulator to start"
        if [[ $failcounter -gt timeout_in_sec ]]; then
            echo "Timeout ($timeout_in_sec seconds) reached; failed to start emulator"
            exit 1
        fi
    fi
    sleep 10
done

echo "Emulator is ready"
