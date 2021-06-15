#!/bin/bash
read -p "Enter the count of the testcase : " Testcase # Read the input for no of test cases

if [ "$Testcase" -gt 51 ] || [ "$Testcase" -lt 0 ]; then # check the condition for the test cases
   echo "please enter the correct testcase"
else
a=0
while [ $a -lt $Testcase ]
do
read -p "Enter the no of mins: " Time
read -p "Enter the string combiation " StringVal
echo $Time
echo $StringVal
   a=`expr $a + 1`
done > Data.txt
fi
#Read the input of TIME and STRING and input into a file

awk '/ /{print}' Data.txt > StringData.txt #Break the string part alone into new file

while read -r line
do
stringcheck=`echo "$line" | awk 'BEGIN{IGNORECASE=1} /cookie/||/milk/{printf "Found" }'` #check if cookie or milk is present
if [[ $stringcheck ==  "Found" ]]; then

stringpresent=`echo "$line" |  awk '{for(i=1;i<=NF;i++)if($i=="cookie")print $(i+1)}'|awk 'NR==1'` #check for the occurance of milk after cookie

if [[ $stringpresent == "milk" ]] || [[ $stringpresent == "" ]]; then # Print YES or no based on the condition
 echo Yes
else
 echo No
fi

else
 echo Kindly enter the proper string with milk and cookies combination.
fi

done < StringData.txt


