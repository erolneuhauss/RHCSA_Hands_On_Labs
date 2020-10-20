<pre>
yum install -y stratisd stratis-cli
</pre>

<pre>
systemctl enable --now stratisd
</pre>

<pre>
stratis pool create pool0 /dev/sdb
</pre>

<pre>
stratis pool list
</pre>

<pre>
stratis pool add-data pool0 /dev/sdc
</pre>

<pre>
stratis blockdev list
</pre>

<pre>
stratis filesystem create pool0 stratis_fs1
</pre>

<pre>
stratis filesystem create pool0 stratis_fs2
</pre>

<pre>
stratis filesystem list
</pre>

<pre>
blkid /stratis/pool0/stratis_fs1
blkid /stratis/pool0/stratis_fs2
</pre>

<pre>
echo 'UUID=<UUID> /mnt/fs1 xfs defaults,x-systemd.requires=stratisd.service 0 0' >> /etc/fstab
echo 'UUID=<UUID> /mnt/fs2 xfs defaults,x-systemd.requires=stratisd.service 0 0' >> /etc/fstab
</pre>

<pre>
echo 'do not delete me!!!' > /mnt/fs1/very_important_file
</pre>
