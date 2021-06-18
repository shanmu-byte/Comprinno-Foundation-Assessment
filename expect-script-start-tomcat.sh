#!/usr/bin/expect

set timeout 2

set ip [lindex $argv 0]

set user [lindex $argv 1]

set password [lindex $argv 2]

set x "process"

spawn ssh  "$user\@$ip"

expect "Password:"

send "$password\r"

expect "file search:"

send "ls -lrt\r"

expect "process-count x : "

send "cat process1.lst | grep tomcat | grep -v grep \r"

if {"cat process1.lst | grep tomcat | grep -v grep | wc -l" != "0"} {

expect "change directory:"

send "cd /opt/int1/apache-tomcat-8.5.41/bin/\r"

expect "execute the tomcat script"

send "./startup.sh\r"


}

interact


