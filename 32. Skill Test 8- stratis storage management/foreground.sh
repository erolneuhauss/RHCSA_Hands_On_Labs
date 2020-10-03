#/bin/bash
set -ex

truncate -s 10g /tmp/loop0.img
losetup /dev/loop0 /tmp/loop0.img

truncate -s 10g /tmp/loop1.img
losetup /dev/loop1 /tmp/loop0.img
