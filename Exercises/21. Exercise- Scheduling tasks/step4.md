<pre> Add the following sources back into the chrony.conf file </pre>
<pre>
hostname and options are as follows:
server 0.north-america.pool.ntp.org iburst
server 1.north-america.pool.ntp.org
server 2.north-america.pool.ntp.org
server 3.north-america.pool.ntp.org

<pre> Confirm by running the sources command you used in the previous step. </pre>


Verify answer with:`CHECK=$( cat /etc/chrony.conf | awk '/north-america.pool/ {print $3}' ) && [[ $CHECK == "iburst" ]] && echo "${GREEN}Awesome Job, Proceed ${RESET}" || echo "${RED}Try Again ${RESET}"`{{execute}}
