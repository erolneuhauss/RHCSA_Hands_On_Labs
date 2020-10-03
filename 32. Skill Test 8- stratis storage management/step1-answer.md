<pre>
yum install -y stratisd stratis-cli
</pre>

<pre>
systemctl enable --now stratisd
</pre>

<pre>
stratis pool create pool1 /dev/sdb
</pre>

<pre>
stratis pool list
</pre>

<pre>
stratis pool add-data pool1 /dev/sdc
</pre>

<pre>
stratis blockdev list
</pre>

<pre>
stratis filesystem create pool1 fs1
</pre>

<pre>
stratis filesystem list
</pre>

<pre>
blkid /stratis/pool1/fs1
</pre>

<pre>
</pre>

<pre>
</pre>

<pre>
</pre>

<pre>
</pre>

<pre>
</pre>

<pre>
</pre>

<pre>
</pre>

