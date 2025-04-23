
#!/bin/bash

myIP=$(bash myIP.bash)


# Todo-1: Create a helpmenu function that prints help for the script
function helpMenu(){
echo "HELP MENU"
echo "--------------------------"
echo "-n: Add -n as an argment for this script to use nmap"
echo "-n external : External NMAP scan"
echo "-n internal : Internal NMAP scan"
echo "-s: Add -s as an argument for this script to use ss (Netstat)"
echo "-s external : External Netstat scan"
echo "-s internal : Internal Netstat scan"
echo "Usage: bash networkchecker.bash -n/-s external/internal"
echo "--------------------------"
}


# Return ports that are serving to the network
function ExternalNmap(){
  rex=$(nmap "${myIP}" | awk -F"[/[:space:]]+" '/open/ {print $1,$4}' )
}

# Return ports that are serving to localhost
function InternalNmap(){
  rin=$(nmap localhost | awk -F"[/[:space:]]+" '/open/ {print $1,$4}' )
}

# Only IPv4 ports listening from network
function ExternalListeningPorts(){
idk=$(ss -ltn | awk -F"[[:space:]:(),]+" '!/127.0.0./ {print $5,$9}' | tr -d "\"")
}

# Only IPv4 ports listening from localhost
function InternalListeningPorts(){
ilpo=$(ss -ltpn | awk  -F"[[:space:]:(),]+" '/127.0.0./ {print $5,$9}' | tr -d "\"")
}

if [ ${#} -ne  2 ]
then helpMenu
exit
fi

while getopts "n:s:" option
do 
	case $option in
	n)
		echo "Argument of n: ${OPTARG} "
		if [ "${OPTARG}" = "internal" ]; then
		InternalNmap
		echo "$rin"
		elif [[ "${OPTARG}" == "external" ]]; then
		ExternalNmap
		echo "$rex"
		else 
			echo "Arugment is not internal or external, see Help Menu"
                 helpMenu
                 fi
	;;
	s)
		echo "Argument of s: ${OPTARG} "
		if [[ "${OPTARG}" == "internal" ]]; then
                InternalListeningPorts
                echo "$ilpo"
               elif [[ "${OPTARG}" == "external" ]]; then
                ExternalListeningPorts
                echo "$idk"
                 else 
                     echo "Arugment is not internal or external, see Help Menu"
                helpMenu
		fi
	;;
	:)
		helpMenu
	;;
	?)
		helpMenu
	esac
done


