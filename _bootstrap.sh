# Update Packages
apt-get update

# Upgrade Packages
apt-get upgrade

# Apache
apt-get install -y apache2

# Enable Apache mod_rewrite
a2enmod rewrite

#Add PHP repository from Ondřej
# apt-add-repository ppa:ondrej/php
apt-get update

# Install PHP
apt-get install -y php7.3

# PHP Apache Module
apt-get install -y libapache2-mod-php7.3

# Restart Apache
service apache2 restart

# character passwords
#--------------------------------------------------
MYSQL_PASSWORD='password'
PMA_PASSWORD='password'
# MySQL Pass
debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_PASSWORD"
# Set phpMyAdmin password.
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PMA_PASSWORD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PMA_PASSWORD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PMA_PASSWORD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"


# PHP Modules
apt-get install -y php-pear
apt-get install -y php7.3-cli
apt-get install -y php7.3-common
apt-get install -y php7.3-mcrypt
apt-get install -y php7.3-zip
apt-get install -y php7.3-curl
apt-get install -y php7.3-dev
apt-get install -y php7.3-gd
apt-get install -y php7.3-mbstring
apt-get install -y php7.3-mysql
apt-get install -y php7.3-xml
apt-get install -y php7.3-fpm
apt-get install -y libapache2-mod-php7.3
apt-get install -y php7.3-imagick
apt-get install -y php7.3-recode
apt-get install -y php7.3-tidy
apt-get install -y php7.3-xmlrpc
apt-get install -y php7.3-intl
# use wordpress
apt-get install -y php7.3-bcmath
# apt-get install -y imagemagick
# MySQL
apt-get install -y mysql-server
apt-get install -y phpmyadmin

# setup hosts file
VHOST=$(cat <<EOF
<Directory "/var/www/html/">
    AllowOverride All
    Require all granted
</Directory>

Listen 8001
#Listen 8002
#Listen 8003
# Listen 8004
# Listen 8005
#
<VirtualHost *:80>
   DocumentRoot "/var/www/html/default.example.com"
   php_admin_value auto_prepend_file /var/www/html/document_root.php
</VirtualHost>
# LARAVEL
<VirtualHost *:8001>
   DocumentRoot "/var/www/html/laravel-test/dest/public"
</VirtualHost>
<VirtualHost *:80>
    ServerName dev.local
    ServerAlias *.dev.local
    VirtualDocumentRoot "/var/www/html/%-3+"
    php_admin_value auto_prepend_file /var/www/html/document_root.php
</VirtualHost>

<VirtualHost *:80>
    ServerAlias *.local
    VirtualDocumentRoot "/var/www/html/%-2+"
    php_admin_value auto_prepend_file /var/www/html/document_root.php
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

# Enable apache modules.
#--------------------------------------------------
a2enmod rewrite
a2enmod vhost_alias
# Restart Apache
service apache2 restart
