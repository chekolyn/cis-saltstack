#!/bin/bash
#    {{ pillar['file_header'] }}
#    Company: {{ pillar['company'] }}
#    sysadmin: {{ pillar['sysadmin'] }} <{{ pillar['sysadmin_email'] }}>
#
## CIS 6.3.1 Upgrade Password Hashing Algorithm to SHA-512 (Scored)

HASH=$(authconfig --test | grep hashing)

if [ "$HASH" != ' password hashing algorithm is sha512' ]; then
  CHANGED="yes"
  COMMENT="--WARNING-- wrong hashing algorithm: see page: 141 of CIS_Red_Hat_Enterprise_Linux_6_Benchmark_v1.1.0.pdf"
else
  CHANGED="no"
  COMMENT="PAM Hashing is sha512"
fi

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment='$COMMENT' hash='$HASH'"