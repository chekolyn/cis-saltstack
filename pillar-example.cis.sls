company: Company Name
sysadmin: Your Name
sysadmin_email: email@example.com
file_header: "** THIS FILE IS MANAGED BY SALT; CHANGES WILL BE OVERWRITTEN **"


## 1.2.2 Verify Red Hat GPG Key is Installed
redhat_gpg_keys:
  RPM-GPG-KEY-redhat-release: "567E 347A D004 4ADE 55BA 8A5F 199E 2F91 FD43 1D51"
  RPM-GPG-KEY-redhat-legacy-release: "47DB 2877 89B2 1722 B6D9 5DDE 5326 8101 3701 7186"
  RPM-GPG-KEY-redhat-legacy-former: "CA20 8686 2BD6 9DFC 65F6 ECC4 2191 80CD DB42 A60E"
  RPM-GPG-KEY-redhat-legacy-rhx: "01AD EFD1 5A95 AE43 14DE 83C2 39A1 3A12 4219 3E6B"

centos_gpg_keys:
  RPM-GPG-KEY-CentOS-6: "C1DA C52D 1664 E8A4 386D  BA43 0946 FCA2 C105 B9DE"

epel_gpg_keys:
  RPM-GPG-KEY-EPEL-6: "8C3B E96A F230 9184 DA5C  0DAE 3B49 DF2A 0608 B895"


## 1.5.3 Set Boot Loader Password
grub_change_password: no
# Default grub_change_password: "password"; please change this
grub_md5_password: $1$zH9/LuR8$mSaGkvtLcwf7U6iy/KudL1


## 3.6 Configure Network Time Protocol (NTP)
# You should change this servers if you have local ntp servers in your organization
ntp_servers:
  primary: 0.pool.ntp.org 
  secondary: 1.pool.ntp.org
  tertiary: 2.pool.ntp.org
  forth: 3.pool.ntp.org

## 5.1.5 Configure rsyslog to Send Logs to a Remote Log Host
rsyslog_server:  syslog-server.example.com

## 8.1 Set Warning Banner for Standard Login Services (Scored)
motd_msg: "\n-- WARNING --\nThis system is for the use of authorized users only. Individuals\nusing this computer system without authority or in excess of their\nauthority are subject to having all their activities on this system\nmonitored and recorded by system personnel. Anyone using this\nsystem expressly consents to such monitoring and is advised that\nif such monitoring reveals possible evidence of criminal activity\nsystem personal may provide the evidence of such monitoring to law\nenforcement officials."

issue_msg: "\n-- WARNING --\nThis system is for the use of authorized users only. Individuals\nusing this computer system without authority or in excess of their\nauthority are subject to having all their activities on this system\nmonitored and recorded by system personnel. Anyone using this\nsystem expressly consents to such monitoring and is advised that\nif such monitoring reveals possible evidence of criminal activity\nsystem personal may provide the evidence of such monitoring to law\nenforcement officials."

## 4.4 Disable IPv6    
enable_ipv6: no

## 4.5.2 Create /etc/hosts.allow
## Opening to all local private networks by default
hosts_allow_subnet: "10.0.0.0/255.0.0.0, 172.16.0.0/255.240.0.0, 192.168.0.0/255.255.0.0"

