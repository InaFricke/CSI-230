#! /bin/bash
clear

# filling courses.txt
bash courses.bash

courseFile="courses.txt"

function displayCoursesofInst(){

echo -n "Please Input an Instructor Full Name: "
read instName

echo ""
echo "Courses of $instName :"
cat "$courseFile" | grep "$instName" | cut -d';' -f1,2 | \
sed 's/;/ | /g'
echo ""

}

function courseCountofInsts(){

echo ""
echo "Course-Instructor Distribution"
cat "$courseFile" | cut -d';' -f7 | \
grep -v "/" | grep -v "\.\.\." | \
sort -n | uniq -c | sort -n -r 
echo ""

}

function displayCourseLocation(){
echo -n "Please Input a class location exp. JOYC 310 :"
read location

echo "Courses in $location"
cat  "$courseFile"| grep "$location" | cut -d';' -f1,2,5,6,7 |\
sed 's/;/ | /g'
}

function displayCourseA(){
echo -n "Please Input a course code exp. SEC: "
read code
seats=$(cat "$courseFile" | grep "$code")

echo "$seats" | while read -r line;
do 
	num=$(echo "$line" | cut -d';' -f4)
	if [ $num -gt 0 ]
		then
			echo "$line" | cut -d';' -f1,4 | sed 's/;/ | /g' 
	fi
done
}


while :
do
	echo ""
	echo "Please select and option:"
	echo "[1] Display courses of an instructor"
	echo "[2] Display course count of instructors"
	echo "[3] Display all courses in the provided locaton"
	echo "[4] Display all the courses that have availibility"
	echo "[5] Exit"

	read userInput
	echo ""

	if [[ "$userInput" == "5" ]]; then
		echo "Goodbye"
		break

	elif [[ "$userInput" == "1" ]]; then
		displayCoursesofInst

	elif [[ "$userInput" == "2" ]]; then
		courseCountofInsts
	elif [[ "$userInput" == "3" ]]; then
		displayCourseLocation

	elif [[ "$userInput" == "4" ]]; then
		displayCourseA
	else  
		echo "Invalid input please try agian"  

	fi
done
