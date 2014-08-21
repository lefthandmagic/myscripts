#!/bin/bash
SIZE=0
INPUT=$1
START_OFFSET=`echo $INPUT| cut -d'-' -f 4`
CURRENT_BYTE_OFFSET="10#$START_OFFSET"
while read line
do
  LINESIZE=${#line}
  CURRENT_BYTE_OFFSET=$((CURRENT_BYTE_OFFSET + LINESIZE + 10))
  echo "Current Byte offset: $CURRENT_BYTE_OFFSET"
  SIZE=$((SIZE + LINESIZE))
done < $INPUT
echo "The total size is: $SIZE"
