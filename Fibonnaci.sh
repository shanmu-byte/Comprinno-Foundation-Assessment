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
i=0

for val in ${StringVal[@]};do

Repeated=`echo $val |  fold -w1 |  sort -nr | uniq -c | sort -nr | awk 'NR==1{print $1}'`

Uniquecount=`echo $val | fold -w1 |  sort -nr | uniq -u | wc -l`

#break the charaters and count the repeat and unique count 

if [ "$Repeated" -lt 4 ] || [ "$Uniquecount" -gt 3 ]; then
 echo Not
else
 echo Dynamic
fi
i=$(expr $i + 1)
if [ "$i" == $Testcase ]; then
        break;
fi


done
fi
fi


