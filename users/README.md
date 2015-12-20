# scripts related to users manage, login, remote login, etc ... 

## send_mail_on_login.sh

Send one mail to root every time a user log in the system via SSH ( one login, one mail)

Copy the script to /usr/local/sbin/, give execution permissions (chmod +x /usr/local/sbin/send_mail_on_login.sh) and add to /etc/pam.d/sshd 

```
session optional pam_exec.so /usr/local/sbin/send_mail_on_login.sh
```
I learned this on http://blog.th-neumeier.de/2011/02/send-email-on-ssh-login-using-pam/ (so thanks)
