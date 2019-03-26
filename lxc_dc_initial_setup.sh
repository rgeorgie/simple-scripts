#! /bin/bash

# Author: Rosen Georgiev aka Subzer0
# Join containers to domain.
# I definitely don't like to repeat
# what if have 1000 containers to join
# it is tested under ProxmoxVE Ubuntu containers and AD

# the domain name is set up TODO
dOmain=$(dnsdomainname)

# This add the domain users to sudoers and reload the profile

# check if already there
    if [[ $(cat /etc/sudoers | grep SysAdmin) ]];then
        echo "SysAdmin was here"
    else
        echo -e "#Added by the SysAdmin\n%sudo@$dOmain ALL=(ALL) ALL" >> /etc/sudoers &&
        sed -i "s/services = nss, pam/services = nss, sudo, pam, ssh #by SysAdmin/g" /etc/sssd/sssd.conf &&
        source ~/.bashrc
    fi

# update&upgrade
apt update && apt -y upgrade &&
# packages needed
apt install -y realmd packagekit &&

# Create user folders
# check if already done

    if [[ $(cat /etc/pam.d/common-session | grep pam_mkhomedir.so) ]];then
        echo "That's done! SysAdmin was here."
    else
        echo -e "#Added by the SysAdmin\nsession optional  pam_mkhomedir.so" >> /etc/pam.d/common-session &&
        source ~/.bashrc
    fi

# Change timezone !!!! Change with your timezone.
timedatectl set-timezone America/Halifax &&

# ask for DC Admin
read -p "Enter $dOmain DC Admin: " aDmin

# join the domain
realm join --user=$aDmin $dOmain &&

# Confirm
realm list

# Enjoy (Subzer0)