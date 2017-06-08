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
echo "" > addedfiles
HUNNERD=100
echo going to use $SRCES as a list of input files to copy
cat $SRCES | while read LN 
do
  echo ${PREFIX}${LN} >> addedfiles
  COUNT=`wc -l addedfiles | awk '{print $1}'`
  if [ $COUNT -ge $HUNNERD ] ; then
    echo Adding the next $COUNT
    tar --append -f curt.tar `cat addedfiles`
    ls -ltrh curt.tar
    echo "" > addedfiles
  fi
done
echo The end of Curt > curt
UNO=1
echo Adding the next $COUNT
tar --append -f curt.tar `cat addedfiles` curt
ls -ltrh curt.tar

