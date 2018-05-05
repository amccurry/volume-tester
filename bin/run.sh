#!/bin/bash
set -e
mkdir -p $VOL1/test
mkdir -p $VOL2/test
diff -rq $VOL1/test $VOL2/test
for FILE in {1..100} ; do
  UUID=$(uuid)
  mkdir -p $VOL1/test/$UUID
  mkdir -p $VOL2/test/$UUID
  COUNT=$(shuf -i 100-1000 -n 1)
  dd if=/dev/urandom bs=1K count=$COUNT 2>/dev/null | tee $VOL2/test/$UUID/$FILE >$VOL1/test/$UUID/$FILE
done

