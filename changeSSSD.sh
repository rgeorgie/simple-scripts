#! /bin/bash

for i in $(pct list | grep running |  awk '/[0-9]/{print $1}'); do 

echo -e "----------------------------\n--- for container $i ---\n----------------------------"

pct exec $i -- bash -c 'sed -i "s/services = nss, pam/services = nss, sudo, pam, ssh #by SysAdmin/g" /etc/sssd/sssd.conf' &&
pct exec $i -- bash -c 'cat /etc/sssd/sssd.conf' &&

echo -e "-----------------------------------\n- Done `date` -\n-----------------------------------\n"

done
