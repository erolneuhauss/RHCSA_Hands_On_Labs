#!/bin/bash
set -x

for i in {0..5}; do
  truncate -s 3g /tmp/loop${i}.img
  losetup /dev/loop${i} /tmp/loop${i}.img
done
