#!/bin/bash

#Accept runtime args: filesdir, searchstr --> Exit if both args not provided
# Also exit with RetCode 1 if filesdir is not on system

if [ $# -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

#Check if filesdir present
if [ ! -d $filesdir ]; then
    echo "Error: $filesdir is not a directory."
    exit 1
fi

# find all files in directory and subdirectories
files=($(find $filesdir -type f))
num_files=${#files[@]}

echo $num_files
matching_lines=0

for file in ${files[@]}; do 
    matching_lines=$((matching_lines + $(grep -c $searchstr $file)))
done

echo "The number of files are $num_files and the number of matching lines are $matching_lines"

exit 0