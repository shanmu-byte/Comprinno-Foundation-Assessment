#!/usr/bin/expect
log_user 0
set username [lindex $argv 0]
set password [lindex $argv 1]
set host_file [lindex $argv 2]
set newpassword [lindex $argv 3]
set multiPrompt "(|#|$|)"
set f [open "$host_file"]
set hosts [read $f]
close $f
foreach host $hosts {
puts "\n== changing the new password for the $username in the $host ==\n"
spawn -noecho ssh -q -o "StrictHostKeyChecking=no" $username@$host
expect "password:"
send "$password\r"
expect {
# -re "Permission denied, please try again." {send_user "\nPermission denied for $host\n" ; exit}
eof {send_user "\nAccount expired for $host\n"; exit}
# "*\$" {send_user "\nRoot is not forcing to change the password\n"; exit}
}
expect "(current) UNIX password:"
send "$password\r"
expect "New UNIX password:"
send "$newpassword\r"
expect {
 "BAD PASSWORD:" {send_user "\nBAD Password , kindly give strong password\n";exit}
}
expect "Retype new UNIX password:"
send "$newpassword\r"
expect -re $multiPrompt
send_user "\nPassword changed successfully for the $username in the $host\n"
send "exit\r"
expect "Connection closed:"
}
