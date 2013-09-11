#!/bin/bash
#    {{ pillar['file_header'] }}
#    Company: {{ pillar['company'] }}
#    sysadmin: {{ pillar['sysadmin'] }} <{{ pillar['sysadmin_email'] }}>
#
## CIS 1.2.2 Verify Red Hat GPG Key is Installed (Scored)

#echo "Testing RedHat GPG rpm keys..."

REDHAT_KEYS=$(rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey | grep 'Red Hat' | wc -l)

if [ "$REDHAT_KEYS" != 5 ]; then
  CHANGED="yes"
  COMMENT="'Wrong number of gpg keys'"
else
  CHANGED="no"
  COMMENT="'Keys are correct'"
fi

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment=$COMMENT redhat-gpg-keys=$REDHAT_KEYS"