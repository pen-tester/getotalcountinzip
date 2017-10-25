#!/bin/bash
# A simple script

mydir=$1;
total=0;
echo 'finding in '$mydir;
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
#for file in $1/?**/*.zip
for file in $(find $mydir -iname \*.zip)
do
#  echo "zipinfo  '$file'";
  info=$( zipinfo -m "$file" | grep -o "number of entries: [0-9]*" ); # | awk -F  ": " '/1/ {print $2}');
  info=$( echo "$info" | grep -o "[0-9]*");
  total=$(( total + info ));
  echo "entry:$info  filename:$file";
done
echo "total: $total";
