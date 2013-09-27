#!/bin/bash
#    {{ pillar['file_header'] }}
#    Company: {{ pillar['company'] }}
#    sysadmin: {{ pillar['sysadmin'] }} <{{ pillar['sysadmin_email'] }}>
#
## CIS 1.2.2 Verify Red Hat GPG Key is Installed (Scored)
echo "Testing {{ grains['os'] }} GPG rpm keys"

{% for file in pillar[ grains['os'] + '_gpg_keys'] %}
echo "Currently testing file:/etc/pki/rpm-gpg/{{ file }}"
ANSWER=$(gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/{{ file }} | grep -c "Key fingerprint = {{  pillar[ grains['os'] + '_gpg_keys'][file] }}")

if [ $ANSWER != 1 ]; then
  echo "---WARNING---"
  echo "The GPG key for: {{file}}  DOESN'T MATCH!!!!!!"
  echo "Expected fingerprint: {{  pillar[ grains['os'] + '_gpg_keys'][file] }}"
  echo "This is the full output:"
  gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/{{ file }}
  WRONGKEY=true
  
fi
{% endfor %}

if [ $WRONGKEY ]; then
  CHANGED="yes"
  COMMENT="'Check GPG KEYS'"
else
  CHANGED="no"
  COMMENT="'Keys are correct'"
fi

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment=$COMMENT"