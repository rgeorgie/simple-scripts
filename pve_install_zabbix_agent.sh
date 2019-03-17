#!/bin/bash

# Execute from inside the container
# Install zabbix-agent on Ubuntu LXC nodes
# Feb-13-2019
# Rosen Georgiev a.k.a. Subzer0

hostN=$(hostname)

read -p "Enter the Zabbix Server hostname: " zabServer

set -e

# check if already set-up

  if [[ $(systemctl status zabbix-agent | grep running) ]]; then
    break
  else
    mkdir -p ~/InitialSetup/zabbix && cd ~/InitialSetup/zabbix
  fi

wget https://repo.zabbix.com/zabbix/4.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.0-2+bionic_all.deb && #TODO

dpkg -i zabbix-release_* &&

apt update &&

apt-get install zabbix-agent &&

sed -i "s/Server=127.0.0.1/Server=$zabServer/g" /etc/zabbix/zabbix_agentd.conf &&

sed -i "s/ServerActive=127.0.0.1/ServerActive=$zabServer/g" /etc/zabbix/zabbix_agentd.conf &&

sed -i "s/Hostname=Zabbix server/Hostname=$hostN/g" /etc/zabbix/zabbix_agentd.conf &&

systemctl start zabbix-agent &&

systemctl enable zabbix-agent &&

ufw allow 10050/tcp && ufw reload

echo "Done by SysAdmin `date`"
