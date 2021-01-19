#!/bin/bash
path='/home/sotatek/Music/cd/hi'
size=$(du -k $path | awk '{ print $1 }')
echo "size file=$size kilobytes"
minimumsize=5242880
minimumsizefile=0
if ((SIZE<minimumsize)) ; then
    echo size is over $minimumsize kilobytes
    for file in $(ls -lt $path | awk '{ print $10 }'); do
        sizefile=$(du -k $path'/'$file | awk '{ print $1 }')
        echo $sizefile
        if [[ $file == *".log" && $file == "laravel-"* && $sizefile -gt $minimumsizefile ]]; then 
            > $path'/'$file
        fi
    done
else
    echo size is under $minimumsize kilobytes
fi



