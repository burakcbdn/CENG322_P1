#!/bin/bash

echo "Enter a sequence of numbers followed by "end""

TOTAL=0

while [ 1 -eq 1 ]
do
    read NUMBER

    # read number from the console until "end" inputted
    if [ $NUMBER == "end" ]
    then
        echo "Maximum: $TOTAL"
        exit 0
    fi
    ((TOTAL+=$NUMBER))
done