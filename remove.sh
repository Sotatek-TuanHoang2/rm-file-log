#!/bin/bash
path='/var/www/api/storage/logs'
size=$(du -k $path | awk '{ print $1 }')
echo "size file=$size kilobytes"
minimumsize=5242880
minimumsizefile=1048576
if [[ $size -gt $minimumsize ]]; then
    echo size is over $minimumsize kilobytes
    for file in $(ls -lt $path | awk '{ print $9 }'); do
        sizefile=$(du -k $path'/'$file | awk '{ print $1 }')
        echo $sizefile
        if [[ $file == *".log" && $file == "laravel-"* && $sizefile -gt $minimumsizefile ]]; then
            > $path'/'$file
        fi
    done
else
    echo size is under $minimumsize kilobytes
fi
