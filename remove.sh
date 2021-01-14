#!/bin/bash
path='/home/sotatek/Music/cd/hi'
size=$(du -k hi | awk '{ print $1 }')
echo "size=$size kilobytes"
minimumsize=5242880 
if ((SIZE>minimumsize)) ; then
    echo size is over $minimumsize kilobytes
    for file in $(ls -lt $path | awk '{ print $10 }'); do
        if [[ $file == *".log" && $file == "larvel-"* ]]; then
            : > $path'/'$file
        fi
      done
else
    echo size is under $minimumsize kilobytes
fi

