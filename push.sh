#!/bin/sh
cd `dirname $0`
LENGTH=${1-1}
COUNT=$(($LENGTH*3/4 + 1))
CHAR1=`dd if=/dev/urandom bs=1 count=$COUNT 2>/dev/null | base64 -w0 | cut -c -$LENGTH`
CHAR2=`dd if=/dev/urandom bs=1 count=$COUNT 2>/dev/null | base64 -w0 | cut -c -$LENGTH`

echo $CHAR1 >> README.md
/bin/git add README.md
/bin/git commit -m $CHAR2
/bin/git push origin master

