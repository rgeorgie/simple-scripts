#! /bin/bash

# update LXC containers under ProxmoxVE
# Author: Rosen Georgiev a.k.a Subzer0
# Date: Feb-12-2019
# Re-Tested :) with PVE 4.15.18-32 and deb containers

# Works on the current node only!!! TODO

# Don't do it if you're not tested the updates first!!!

# listing all running containers

for i in $(pct list | grep running |  awk '/[0-9]/{print $1}'); do

# Updting them

echo -e "----------------------------\n--- for container $i ---\n----------------------------"

pct exec $i -- bash -c 'apt update' &&
pct exec $i -- bash -c 'apt -y upgrade' &&

echo -e "-----------------------------------\n- Done `date` -\n-----------------------------------\n"

done


#use on your own risk!!!
# Subzer0