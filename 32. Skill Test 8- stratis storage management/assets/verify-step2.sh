
#!/bin/bash
### Variables####
#
RESET=$(tput sgr0)
#
### Functions###
#
################################
#Description of function: Print a given message in color
#Arguments:"color""text"
#Colors accepted: green red

################################
function print_color(){
  case $1 in
    "green")COLOR="\033[0;32m";;
    "red")COLOR="\033[0;31m";;
    "NC")COLOR="\033[0m";;
    "*")COLOR="\033[0m";;
  esac
  echo -e "${COLOR} $2 ${RESET}"
}
############################
#Description: Compares two strings
#Arguments: String1 String2 number
###########################
function comparison(){
  if [ "${1}" = "${2}" ]; then
    print_color "green" "Objective ${3} Complete"
  else
    print_color "red" "Objective ${3} Failed"
    exit 1
  fi
}
#
####Body of Code ####
#
RPMCHECK=$( rpm -qa | grep stratis | wc -l )
comparison ${RPMCHECK} "2" "1"
ENABLED="$( systemctl status stratisd | grep -o 'service; enabled' )"
comparison "${ENABLED}" 'service; enabled' "2"
ACTIVE_RUNNING="$( systemctl status stratisd | grep -o 'Active: active (running)' )"
comparison "${ACTIVE_RUNNING}" "Active: active (running)" "3"
POOL_EXISTS="$( stratis pool | grep -o 'pool0' )"
comparison "${POOL_EXISTS}" "pool0" "4"
DEV_EXISTS="$( stratis blockdev list | grep -o -P 'loop[01]' | wc -l )"
comparison "${DEV_EXISTS}" "2" "5"
FS1_EXISTS="$( stratis filesystem list | grep -o '/stratis/pool0/stratis_fs1' )"
comparison "${FS1_EXISTS}" "/stratis/pool0/stratis_fs1" "6"
FS2_EXISTS="$( stratis filesystem list | grep -o '/stratis/pool0/stratis_fs2' )"
comparison "${FS2_EXISTS}" "/stratis/pool0/stratis_fs2" "7"
MOUNT=$( mount | grep stratis | wc -l)
comparison "${MOUNT}" "2" "8"
FSTAB="$( grep -qP '^UUID.+xfs.+defaults,x-systemd.requires=stratisd.service.+0.+0$' /etc/fstab && echo $? )"
comparison "${FSTAB}" "0" "9"
FILE=$( [ -f /mnt/fs1/very_important_file ] && echo $? )
comparison "${FILE}" "0" "10"
SNAP=$( stratis filesystem | grep -q fs1_snapshot && echo $? )
comparison "${SNAP}" "0" "11"

print_color "green" "You Freaking Rock "
