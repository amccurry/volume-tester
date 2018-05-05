#!/bin/bash
set -e
PASS=0
while [ true ] ; do
  docker run --rm -it -e VOL1=/vol1 -v $PWD/vol1:/vol1 -e VOL2=/vol2 -v testpack:/vol2 volumetester /reset.sh
  for TEST in {1..100} ; do
    echo "Pass $PASS/$TEST"
    docker run --rm -it -e VOL1=/vol1 -v $PWD/vol1:/vol1 -e VOL2=/vol2 -v testpack:/vol2 volumetester
  done
  PASS=$((PASS+1))
done
