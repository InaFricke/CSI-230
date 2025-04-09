#! /bin/bash
# log the file access
accessTime=$(date | sed 's/:/-/g')
echo "File userlogs-1.bash was accessed at $accessTime" >> home/champuser/SYS320-01/week13/fileaccesslog.txt
# create and send email
function userLogAccess(){
logline=$(cat fileaccesslog.txt)

echo "To: ina.fricke@mymail.champlain.edu" > emailform.txt
echo "Subject: File Access" >> emailform.txt
cat home/champuser/SYS320-01/week13/fileaccesslog.txt >> emailform.txt
cat emailform.txt | ssmtp ina.fricke@mymail.champlain.edu
}
userLogAccess
