#!/usr/bin/expect
log_user 0
set username [lindex $argv 0]
set password [lindex $argv 1]
set host_file [lindex $argv 2]
set newpassword [lindex $argv 3]
set multiPrompt "(%|#|cli\>|\$|\-\-\-\>)"
set f [open "$host_file"]
set hosts [read $f]
close $f

foreach host $hosts {
puts "\n== changing the old password for the $username in the $host == \n"
spawn -noecho ssh -q -o "StrictHostKeychecking=no" "$username\@$host"
expect "password:"
send "$password\r"

expect {
    timeout { send_user "\nLogin failed. Password incorrect for $host.\n"; exit}
     eof {send_user "\nAccount expired for $host\n"; exit}
"*\$"
}

expect {
            "(current) UNIX password:" {send $password\r; exp_continue}
            "New password:" {send $newpassword\r; exp_continue}
            "Retype new password:" {send $newpassword\r; exp_continue}
            "~]$" {exit}

}
send "echo -e '$password\n$newpassword\n$newpassword' | passwd\r"
expect "BAD PASSWORD:" {send_user "\nBAD Password , kindly give strong password\n" ; exit}
expect "You must wait longer to change your password" {send_user "\nYou must wait longer to change your password for the $username in the $host\n" ; exit}
expect "passwd: all authentication tokens updated successfully." {send_user "\nPassword changed successfully for the $username in the $host.\n"; exp_continue}
send "exit\r"
expect "Connection closed"
}
~
