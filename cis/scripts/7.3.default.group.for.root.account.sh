#    {{ pillar['file_header'] }}
#    Company: {{ pillar['company'] }}
#    sysadmin: {{ pillar['sysadmin'] }} <{{ pillar['sysadmin_email'] }}>
#
## CIS 7.3 Set Default Group for root Account (Scored)

RESPONSE=$(grep "^root:" /etc/passwd | cut -f4 -d:)

if [ "$RESPONSE" != '0' ]; then
  CHANGED="yes"
  COMMENT="--WARNING-- wrong default group for root account: see page: 152 of CIS_Red_Hat_Enterprise_Linux_6_Benchmark_v1.1.0.pdf"
  #Remediation:
  #usermod -g 0 root
  
else
  CHANGED="no"
  COMMENT="No systems account are enabled"
fi

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment='$COMMENT' response='$RESPONSE'"