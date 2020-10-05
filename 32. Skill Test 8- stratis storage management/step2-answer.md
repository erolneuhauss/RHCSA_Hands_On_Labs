<pre>
mkdir /mnt/fs1-snapshot
mount /stratis/pool0/stratis_fs1-snapshot /mnt/fs1-snapshot
ls -lh /mnt/fs1-snapshot
</pre>

<pre>
umount /mnt/fs1
stratis filesystem destroy pool0 stratis_fs1
stratis filesystem snapshot pool0 stratis_fs1-snapshot stratis_fs1
</pre>

<pre>
mount /stratis/pool0/stratis_fs1 /mnt/fs1-snapshot
ls -lh /mnt/fs1-snapshot
</pre>
