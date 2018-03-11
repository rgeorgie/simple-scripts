#!/bin/bash

#Author: Rosen Georgiev a.k.a Subzer0
#Bash script for restoring Wlan after using Fern
#Version 0.007
#Date Mar 11 2018

#searching for wlan interfaces in monitoring mode
DEV=`ifconfig | awk '/wlan[0-9]mon/ {print $1}' | cut -d ':' -f 1`

#restore the state
for i in $DEV
	do
		echo "Restoring $i state"
		sudo airmon-ng stop $i &
		sleep 5
	done

#restart network-manager
echo "Restarting the network manager"
sudo service network-manager restart

echo "Done `date`"
#safe web surfing!
