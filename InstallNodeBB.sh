#! /bin/bash

# Lets do this too
#
# who knows

cd ~/Downloads/
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - &&
apt install gcc g++ make &&
apt install -y nodejs &&
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5 &&
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.6.list &&
apt update && apt install -y mongodb-org &&
systemctl start mongod.service &&
systemctl enable mongod.service &&

# NOW SOME DB STUFF

# mongo
# use admin
# db.createUser( { user: "admin", pwd: "Zer0coo!", roles: [ { role: "readWriteAnyDatabase", db: "admin" }, { role: "userAdminAnyDatabase", db: "admin" } ] }
# use nodebb
# db.createUser( { user: "nodebb", pwd: "Zer0coo!", roles: [ { role: "readWrite", db: "nodebb" }, { role: "clusterMonitor", db: "admin" } ] } )
# quit()

# resume from here

# echo -e"#Added by SysAdmin\nsecurity:\nauthorization: enabled" >> /etc/mongod.conf
# systemctl restart mongod
# mongo -u admin -p Zer0coo! --authenticationDatabase=admin
# git clone -b v1.9.x https://github.com/NodeBB/NodeBB.git nodebb
# cd nodebb
# ./nodebb setup
# ./nodebb start
# sudo apt install nginx
# sudo nano /etc/nginx/conf.d/nodebb.conf

# server {
#    listen 80;
#
#    server_name forum.computingforgeeks.com;
#
#    location / {
#        proxy_set_header X-Real-IP $remote_addr;
#        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#        proxy_set_header X-Forwarded-Proto $scheme;
#        proxy_set_header Host $http_host;
#        proxy_set_header X-NginX-Proxy true;
#
#        proxy_pass http://127.0.0.1:4567;
#        proxy_redirect off;
#
#        # Socket.IO Support
#        proxy_http_version 1.1;
#        proxy_set_header Upgrade $http_upgrade;
#        proxy_set_header Connection "upgrade";
#    }
#}

#ss -tunelp | grep 4567
# systemctl restart nginx