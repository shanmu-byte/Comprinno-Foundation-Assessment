#!/bin/bash
read -p "Enter the count of the testcase : " Testcase # get the the input for test case number

if [ "$Testcase" -gt 1001 ] || [ "$Testcase" -lt 0 ]; then # check the test case condition
   echo "please enter the correct testcase"
else
a=0
while [ $a -lt $Testcase ]
do
read -p "Enter the Basic Salary: " Salary
echo $Salary
   a=`expr $a + 1`
done > salary.txt 
#Read the salary input and feed into a file
fi

while read -r line
do
if [[ $line -lt 100001 ]] || [[ $line -gt 0 ]]; then

if [[ $line -lt 1500 ]]; then
HRA=`echo "scale=2;$line*10/100" | bc`
DA=`echo "scale=2;$line*90/100" | bc`
GS=`echo "scale=2;$line + $HRA + $DA" | bc`
echo $GS
else
HRA=500
DA=`echo "scale=2;$line*98/100" | bc`
GS=`echo "scale=2;$line + $HRA + $DA" | bc`
echo $GS
fi
#read the file content and perform the salary calculations
else
 echo salart limit 1-10000
fi
done < salary.txt
