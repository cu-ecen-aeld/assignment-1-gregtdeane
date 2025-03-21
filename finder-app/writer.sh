#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Create directory if it doesn't exist
dir=$(dirname $writefile)
mkdir -p $dir

if echo "$writestr" > "$writefile"; then
    exit 0
else
    echo "Error: Could not write to file $writefile"
    exit 1
fi
