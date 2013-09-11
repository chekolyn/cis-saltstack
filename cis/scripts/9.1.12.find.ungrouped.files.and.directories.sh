#    {{ pillar['file_header'] }}
#    Company: {{ pillar['company'] }}
#    sysadmin: {{ pillar['sysadmin'] }} <{{ pillar['sysadmin_email'] }}>
#
## CIS ## 9.1.10 Find World Writable Files (Not Scored)

RESPONSE=$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup -ls)

if [ "$RESPONSE" != '' ]; then
  CHANGED="yes"
  COMMENT="--WARNING-- there are some old files/folders with no group account: see page: 167 of CIS_Red_Hat_Enterprise_Linux_6_Benchmark_v1.1.0.pdf"  
else
  CHANGED="no"
  COMMENT="No un-grouped files"
fi

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment='$COMMENT'"