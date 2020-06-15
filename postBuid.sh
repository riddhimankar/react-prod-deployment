#!/bin/bash

directory=$1
cd build
# Create './web/' $directory
echo '1/4 Create directory $directory'
mkdir $directory

#mv images ./$directory
echo '2/4 Coping files to directory $directory'
find . | grep -Ev '^.$|^.\/$directory$|^.\/static\/.+' | xargs -I{} mv -v {} $directory
cd $directory
echo '2/4 Coping file index.html outside $directory'
cp index.html ../
# Done

