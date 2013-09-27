#!/bin/bash
#    {{ pillar['file_header'] }}
#    Company: {{ pillar['company'] }}
#    sysadmin: {{ pillar['sysadmin'] }} <{{ pillar['sysadmin_email'] }}>
#
## CIS 1.4.6 Check for Unconfined Daemons (Scored)

# Notes: added salt-minion to the exclude list:
RESPONSE=$(ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk|salt-minion" | tr ':' ' ' | awk '{print $NF }')

if [ "$RESPONSE" != '' ]; then
  CHANGED="yes"
  echo "These are the unconfined daemons: "
  echo $RESPONSE
  COMMENT="--WARNING-- there are some unconfined daemons"  
else
  CHANGED="no"
  COMMENT="OK, no unconfined daemons"
fi

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment='$COMMENT'"