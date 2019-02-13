#!/bin/bash

# Install zabbix-agent on ubuntu lxc nodes
# Feb-13-2019
# Rosen Georgiev a.k.a. Subzer0

hostN=$(hostname)
zabServer="Zabbix01" #change it TODO

mkdir ~/InitialSetup && mkdir ~/InitialSetup/zabbix && cd ~/InitialSetup/zabbix &&

wget https://repo.zabbix.com/zabbix/4.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.0-2+bionic_all.deb &&

sudo dpkg -i zabbix-release_* &&

sudo apt update &&

sudo apt-get install zabbix-agent &&

sudo sed -i "s/Server=127.0.0.1/Server=$zabServer/g" /etc/zabbix/zabbix_agentd.conf &&

sudo sed -i "s/ServerActive=127.0.0.1/ServerActive=$zabServer/g" /etc/zabbix/zabbix_agentd.conf &&

sudo sed -i "s/Hostname=Zabbix server/Hostname=$hostN/g" /etc/zabbix/zabbix_agentd.conf &&

sudo systemctl start zabbix-agent &&

sudo systemctl enable zabbix-agent &&

sudo ufw allow 10050/tcp

echo "Done `date`"
