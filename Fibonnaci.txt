#!/bin/bash
read -p "Enter the count of the testcase : " Testcase
read -p "Enter strings separated by 'space' : " StringVal
#Get the input of test case count and strings.strings are stored as a single array seperated by spaces.

if [ "$Testcase" -gt 11 ] || [ "$Testcase" -lt 0 ]; then #check the test case condition
   echo "please enter the correct testcase"
else

echo $Testcase

if [ "${#StringVal[@]}" -gt 100001 ] || [ "${#StringVal[@]}" -lt 0 ]; then #check the string value conditon
 echo "Please enter the string within the limit"
else

for val in ${StringVal[@]};do

Repeated=`echo $val |  fold -w1 |  sort -nr | uniq -c | sort -nr | awk 'NR==1{print $1}'`

Uniquecount=`echo $val | fold -w1 |  sort -nr | uniq -u | wc -l`

#break the charaters and count the repeat and unique count 

if [ "$Repeated" -lt 4 ] || [ "$Uniquecount" -gt 3 ]; then
 echo Not
else
 echo Dynamic
fi

done
fi
fi


1.Get the input of test case count and strings.

2.strings are stored as a single array seperated by spaces.

3.check the test case condition if [ "$Testcase" -gt 11 ] || [ "$Testcase" -lt 0 ].

4.check the string value conditon  if [ "${#StringVal[@]}" -gt 100001 ] || [ "${#StringVal[@]}" -lt 0 ];

5.for each string , break the charaters and count the repeat and unique count 

6.Paste the output as Dynamic or not based on the conditions satisfied

