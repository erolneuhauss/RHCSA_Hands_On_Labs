## stratis storage management
1. install necessary packages
2. make stratis service reboot persistent
3. start stratis service
4. list block devices, create pool named `pool0` with one block device and check your work
5. add another block device to existing pool and check pool block devices
6. create filesystem on `pool1` named `stratis_fs1` and verify
7. create another filesystem on `pool1` named `stratis_fs2` and verify
8. mount `stratis_fs1` on `/mnt/fs1` and `stratis_fs2` on `/mnt/fs2`
9. make both filesystems on persistent
10. create a file named `/mnt/fs1/very_important_file` with the content `do not delete me!!!`
11. create a snapshot of the filesystem `stratis_fs1`

Once complete please run the following command: `bash /tmp/verify-step1.sh`{{execute}}
