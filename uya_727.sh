#!/bin/bash

command=1
was_error=0

echo "Author: Yakov Usoltsev"
echo ""
echo "File Finder"
echo "This script prints out the name of the currect directory and asks for a file name"
echo "If the file does not exist, script displays an error message and asks for the file name again"
echo "Else, script finds hard links to the given file in the file system and displays their names"
echo ""
echo "Current directory:"
pwd

while [ "$command" -eq "1" ]
do
    echo "Enter filename:"
    read filename
    result=$(find / -name $filename)
    if [ -z "$result" ]
    then
        echo "File not found" >&2;
        was_error=1
    else
        echo $result
        was_error=0
    fi
    echo "Repeat? (Yes - 1, No - 0)"
    read command
done

if [ -z "$was_error" ]
then
    echo 
    exit 1
else
    echo
    exit 0
fi
