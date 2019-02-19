#! /bin/bash

# Author: Rosen Georgiev aka Subzer0
# Join containers to domain.
# I definitely don't like to repeat
# what if have 1000 containers to join
# it is tested under ProxmoxVE Ubuntu containers and AD

# the domain name is set up TODO

# This add the domain users to sudoers and reload the profile

# check if already there
    if [[ $(cat /etc/sudoers | grep SysAdmin) ]];then
        echo "SysAdmin was here"
    else
        echo -e "#Added by the SysAdmin\n%sudo@ad.linuxadmin.club ALL=(ALL) ALL" >> /etc/sudoers &&
        source ~/.bashrc
    fi

# update&upgrade
apt update && apt -y upgrade &&
# packages needed
apt install -y realmd packagekit &&
# Create user folders
echo -e "#Added by the SysAdmin\nsession optional  pam_mkhomedir.so" >> /etc/pam.d/common-session && #TODO Tests
#pam-auth-update &&
# Change timezone !!!! Change with your timezone.
sudo timedatectl set-timezone America/Halifax &&
# ask for Admin
read -p "Enter `dnsdomainname` Admin: " aDmin
# join the domain
realm join --user=$aDmin `dnsdomainname` &&
# Confirm
realm list

# Enjoy (Subzer0)