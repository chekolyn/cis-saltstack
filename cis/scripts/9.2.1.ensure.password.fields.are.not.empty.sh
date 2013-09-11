#    {{ pillar['file_header'] }}
#    Company: {{ pillar['company'] }}
#    sysadmin: {{ pillar['sysadmin'] }} <{{ pillar['sysadmin_email'] }}>
#
## CIS 9.2.1 Ensure Password Fields are Not Empty (Scored)

RESPONSE=$(/bin/cat /etc/shadow | /bin/awk -F: '($2 == "" ) { print $1 " does not have a password "}')

if [ "$RESPONSE" != '' ]; then
  CHANGED="yes"
  COMMENT="--WARNING-- there are users without passwords: see page: 169 of CIS_Red_Hat_Enterprise_Linux_6_Benchmark_v1.1.0.pdf"  
else
  CHANGED="no"
  COMMENT="OK, all users have passwords"
fi

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment='$COMMENT'"




