#!/bin/bash
# generate marp md to html

mdFile=$1
outFile="${mdFile%.raw.md}.html"

header="$( cat <<EOF
---
rawhtml: true
$( sed -n '1,/^---$/ {/^---$/!p}' $mdFile )
---
EOF
)"

echo "generating file: $outFile"

echo "$header" > $outFile

marp $mdFile -o $outFile.tmp
cat $outFile.tmp >> $outFile
rm $outFile.tmp