OUT=$( cat /etc/hosts | grep github ) && [[ $OUT == 140.82.118.4* ]] && echo done