#!/bin/bash
# GET ALL USER INPUT
echo "Domain Name (eg. example.com)?"
read DOMAIN

echo "Updating OS................."
sleep 2;
sudo apt-get update

echo "Installing Nginx"
sleep 2;
sudo apt-get install nginx -y
sudo apt-get install zip -y
sudo apt install unzip -y

echo "Sit back and relax :) ......"
sleep 2;
cd /etc/nginx/sites-available/
wget -O "$DOMAIN" https://goo.gl/s8pdtv
sed -i -e "s/example.com/$DOMAIN/" "$DOMAIN"
sed -i -e "s/www.example.com/www.$DOMAIN/" "$DOMAIN"
sudo ln -s /etc/nginx/sites-available/"$DOMAIN" /etc/nginx/sites-enabled/

sudo mkdir /var/www/"$DOMAIN"
cd /var/www/"$DOMAIN"
sudo su -c 'echo "<?php phpinfo(); ?>" |tee info.php'

sleep 2;
cd ~
sudo chown www-data:www-data -R /var/www/"$DOMAIN"
sudo systemctl restart nginx.service

