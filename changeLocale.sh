#! /bin/bash
# do not use it at all !!!
# Subzer0

for i in $(pct list | grep running |  awk '/[0-9]/{print $1}'); do 

echo -e "----------------------------\n--- for container $i ---\n----------------------------"

pct exec $i -- bash -c 'echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen' &&
pct exec $i -- bash -c 'locale-gen' &&

echo -e "-----------------------------------\n- Done `date` -\n-----------------------------------\n"

done
