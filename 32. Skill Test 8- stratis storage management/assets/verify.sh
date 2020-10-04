
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

print_color "green" "You Freaking Rock "
