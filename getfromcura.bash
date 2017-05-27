#!/bin/bash
PREFIX=/home/bernd/dawork/yocto/poky/rpi-build/
SRCES=$1
echo $SRCES
if [ ! -e $SRCES ] ; then
  echo cannot find $SRCES as sources
  exit 1
fi

echo The Curt Archive > curt
tar cvf curt.tar curt
echo going to use $SRCES as a list of input files to copy
cat $SRCES | while read LN 
do
  tar --append -f curt.tar ${PREFIX}${LN} | grep -v "Removing leading"
  echo after adding `basename $LN`
  ls -ltrh curt.tar
done

