#!/usr/bin/env bash

# May-10-2019
# Rosen Georgiev a.k.a. Subzer0
# Some automation for SuSE containers
# LAMP install - setup

# get IP address
IPaddress=$(ip route | grep src | cut -d " " -f 9)
DatE=$(date)

MsG(){
NuM=$(expr length "$Ban3");
printf '%.s=' $(seq 1 $NuM);
echo -e "\n$Ban3";
printf '%.s=' $(seq 1 $NuM);
echo;
}

# install apache2

zypper install apache2 &&

#sed -i 'FW_CONFIGURATIONS_EXT=""/FW_CONFIGURATIONS_EXT="apache2"/g' /etc/sysconfig/SuSEfirewall2 TODO

systemctl start apache2 &&

systemctl enable apache2 &&

echo -e "<html>\n<body>\n<h1> It works! $DatE Subzer0 </h1>\n</body> \n</html>" > /srv/www/htdocs/index.html
Ban3="= You may test the service on http://$IPaddress ="
MsG;

chown wwwrun /srv/www/htdocs/ -R &&

# install MariaDB

zypper install mariadb mariadb-client mariadb-tools &&
systemctl start mysql &&
systemctl enable mysql &&

Ban3="== Please complete the following MySQL setup =="
MsG;

mysql_secure_installation &&

zypper install php7 php7-mysql apache2-mod_php7 &&

a2enmod php7
systemctl restart apache2

echo "<?php phpinfo(); ?>" > /srv/www/htdocs/test.php &&

Ban3="= You may test PHP service on http://$IPaddress/test.php ="
MsG;

# install phpMyAdmin TODO

Ban3="= Installation DONE at $DatE additional setup necessary! Subzer0 ="
MsG;