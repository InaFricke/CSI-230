#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,12 | tr -d '\.')
 echo "$dateAndUser" 
}

function getFailedLogins(){
logline=$(cat "$authfile" | grep -i "failure")
dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,17 | tr -d '\.')
echo "$dateAndUser"
}

# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test


# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To: ina.fricke@mymail.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp ina.fricke@mymail.champlain.edu

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 
echo "To: ina.fricke@mymail.champlain.edu" > emailform.txt
echo "Subject: Failled Loggins" >> emailform.txt
getFailedLogins >> emailform.txt
cat emailform.txt | ssmtp ina.fricke@mymail.champlain.edu
