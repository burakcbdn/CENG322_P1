#!/bin/bash

FILE_NAME=$1

# read lines of file
while read -r line
do 
    # print '*' to the console until current number reaches to 0
    while [ $line != 0 ]
    do
        (echo -n "*")
        ((line--))
    done
    echo ""
done < <(grep . "$FILE_NAME")

# without grep, read does not reading last line of the file
# putting empty line to the end of file works too

