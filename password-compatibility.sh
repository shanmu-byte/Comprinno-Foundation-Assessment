#!/usr/bin/expect
send "Enter Password\n"
expect  {
-re {(?=.*?[0-9])(?=.*?[a-z])(?=.*?[A-Z])[a-zA-Z0-9&-]*} {send "\nPassword ok\n"}
    timeout { send "\nKindly use one capital letter and combination of  numeric , alphabets , special characters in the password.Do not repeat the passwords used before\n" }
    }
exit
