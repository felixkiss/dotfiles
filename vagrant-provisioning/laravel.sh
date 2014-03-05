#!/usr/bin/env bash

# Variables

MYSQL_ROOT_PASSWORD="root"
MYSQL_DATABASE="laravel"
MYSQL_USERNAME="laravel"
MYSQL_PASSWORD="laravel"

APACHE_ROOT="/vagrant/public"

# 0. Basic stuff

sudo apt-get update
sudo apt-get install -y git

# 1. PHP 5.4

sudo apt-get install -y php5 php5-curl php5-gd php5-mcrypt php5-xdebug php5-mysql

sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini

cat << EOF | sudo tee -a /etc/php5/mods-available/xdebug.ini
xdebug.scream=1
xdebug.cli_color=1
xdebug.show_local_vars=1
EOF

# 2. Apache 2

sudo apt-get install -y apache2

sudo a2enmod ssl
sudo a2ensite default-ssl
sudo sed -i "s/AllowOverride None/AllowOverride All/" /etc/apache2/sites-enabled/000-default
sudo sed -i "s/AllowOverride None/AllowOverride All/" /etc/apache2/sites-enabled/default-ssl
sudo a2enmod rewrite
sudo rm -rf /var/www
sudo ln -fs $APACHE_ROOT /var/www
sudo service apache2 restart

# 3. MySQL

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"
sudo apt-get install -y mysql-server-5.5

mysql -uroot -proot -Bse "CREATE DATABASE \`$MYSQL_DATABASE\`;"
mysql -uroot -proot -Bse "GRANT ALL ON \`$MYSQL_DATABASE\`.* TO $MYSQL_USERNAME@localhost IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -uroot -proot -Bse "GRANT ALL ON \`$MYSQL_DATABASE\`.* TO $MYSQL_USERNAME@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# 4. Composer

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# 5. phpunit

curl -o phpunit.phar https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
sudo mv phpunit.phar /usr/local/bin/phpunit

# 6. Laravel stuff
