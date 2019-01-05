sudo apt-get update

sudo apt-get install nginx -y

cd /etc/nginx/sites-available/

sudo mv default default.backup

wget -O default https://goo.gl/s8pdtv

sudo mkdir /etc/nginx/ssl

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

sudo openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048

cd /etc/nginx/

sudo mv nginx.conf nginx.conf.backup

wget -O nginx.conf https://goo.gl/n8crcR

cd ~

sudo systemctl restart nginx.service

sudo apt install php7.2 php7.2-fpm

sudo apt-get -y install php7.2-fpm php7.22curl php7.2-gd php7.2-imap php7.2-mcrypt php7.2-readline php7.2-common php7.2-recode php7.2-mysql php7.2-cli php7.2-curl php7.2-mbstring php7.2-bcmath php7.2-mysql php7.2-opcache php7.2-zip php7.2-xml php-memcached php-imagick php-memcache memcached graphviz php-pear php-xdebug php-msgpack  php7.2-soap

sudo systemctl restart php7.2-fpm.service

sudo apt install mariadb-server mariadb-client php7.2-mysql

sudo systemctl restart php7.2-fpm.service

sudo mysql_secure_installation
