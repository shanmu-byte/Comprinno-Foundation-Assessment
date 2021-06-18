#!/bin/bash
IPLIST="$1"


for ip in $(cat $IPLIST)

do
    ping -c 3 $ip &> /dev/null
    if [ $? -ne 0 ]; then

        echo $ip is not active , Kindly remove the ip from the respective file;

        else

        echo $ip is active;

    fi

done
