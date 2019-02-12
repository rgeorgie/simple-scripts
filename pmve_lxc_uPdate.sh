#!/usr/bin/env bash

# update LXC containers under ProxmoxVE
# Author: Rosen Georgiev a.k.a Subzer0
# Date: Feb-12-2019
# Tested with PVE 4.15.18-32 and deb containers

#listing all running containers
for i in $(pct list | grep running |  awk '/[0-9]/{print $1}'); do

echo -e "----------------------------\n--- for container '$i' ---\n----------------------------"

# update & upgrade
pct exec "$i" apt update&&apt -y upgrade&&

echo -e "-----------------------------------\n- Done `date` -\n-----------------------------------\n"

done

#use on your own risk!!!