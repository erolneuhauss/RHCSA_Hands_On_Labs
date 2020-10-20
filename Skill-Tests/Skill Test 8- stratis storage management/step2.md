## stratis storage management
We have deleted `/mnt/fs1/very_important_file` you have created before

1. recover the file from the snapshot and make sure it is there
2. delete the snapshot

(3.) do not forget to update the `UUID` in `/etc/fstab`

Once complete please run the following command: `bash /tmp/verify-step2.sh`{{execute}}
