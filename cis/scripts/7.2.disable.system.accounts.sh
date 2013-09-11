#!/bin/bash
#    {{ pillar['file_header'] }}
#    Company: {{ pillar['company'] }}
#    sysadmin: {{ pillar['sysadmin'] }} <{{ pillar['sysadmin_email'] }}>
#
## CIS 6.3.1 Upgrade Password Hashing Algorithm to SHA-512 (Scored)

RESPONSE=$(egrep -v "^\+" /etc/passwd | awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<500 && $7!="/sbin/nologin") {print}')

if [ "$RESPONSE" != '' ]; then
  CHANGED="yes"
  COMMENT="--WARNING-- system account(s) enabled: see page: 151 of CIS_Red_Hat_Enterprise_Linux_6_Benchmark_v1.1.0.pdf"
else
  CHANGED="no"
  COMMENT="No systems account are enabled"
fi

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment='$COMMENT' response='$RESPONSE'"
