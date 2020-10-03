#/bin/bash
set -ex

losetup /dev/loop0 /tmp/loop0.img

losetup /dev/loop1 /tmp/loop0.img
