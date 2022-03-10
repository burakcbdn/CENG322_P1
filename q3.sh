#!/bin/bash

DIRECTORY=$1

# check if entered argument is directory
if [ -d $DIRECTORY ]
then
    FILES=$(ls -l $DIRECTORY)

    REMOVED_COUNT=0

    while read -r file # iterate over result of ls
    do
        
        if [[ $line != total* ]] # ls -l  commands gives total <file count> as first line
        then
            read -r -a DETAILS <<< $file # split file details
            LENGTH=${DETAILS[4]}
            
            if [ $LENGTH -eq 0 ] # empty file found
            then
                FILE_NAME=${DETAILS[8]}
                ((REMOVED_COUNT++))
                (rm "$DIRECTORY$FILE_NAME") # remove the zero-lengt file
            fi
        fi
    done <<< "$FILES" # using [FILES] param inside of quotes for getting it as multiline
    
    # output accoring to the result

    if [ $REMOVED_COUNT -eq 0]
    then
        echo "No files removed"
        exit 0
    fi

    if [ $DIRECTORY == ""]
    then
        echo "$REMOVED_COUNT zero-length files are removed from current directory"
        exit 0
    fi

    echo "$REMOVED_COUNT zero-length files are removed from the directory: $DIRECTORY"
    exit 0

else
    # entered argument is not a directory! FAIL
    echo "Not a directory"
    exit 1
fi





