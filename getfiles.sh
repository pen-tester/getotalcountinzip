#!/bin/bash
# A simple script

mydir=$1;
total=0;
echo 'finding in '$mydir;
#for file in $1/?**/*.zip
for file in $(find $mydir -name "*.zip")
do
  info=$( zipinfo $file | grep -o "number of entries.*" | awk -F  ": " '/1/ {print $2}');
  total=$(( total + info ));
  echo $info;
done
echo 'total:' $total;
