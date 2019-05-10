#!/usr/bin/env bash

# May-10-2019
# Rosen Georgiev a.k.a. Subzer0
# Some automation for SuSE containers
# LAMP install - setup

# get IP address
IPaddress=$(ip route | grep src | cut -d " " -f 9)

# install apache2
zypper install apache2

systemctl start apache2

systemctl enable apache2

echo -e "<html>\n<body>\n<h1> It works!</h1>\n</body> \n</html>" > /srv/www/htdocs/index.html

echo "You may test the service on http://$IPaddress"