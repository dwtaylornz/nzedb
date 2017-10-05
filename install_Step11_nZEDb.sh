# Set permissions 
newgrp www-data
cd /var/www/
mkdir -p /var/www
sudo chown www-data:www-data /var/www
sudo chmod 775 /var/www

# Install Composer 
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
git clone https://github.com/nZEDb/nZEDb.git
cd /var/www/nZEDb
composer install --prefer-source

# Re-apply permissions
sudo chmod -R 755 /var/www/nZEDb/app/libraries
sudo chmod -R 755 /var/www/nZEDb/libraries
sudo chmod -R 777 /var/www/nZEDb/resources
sudo chmod -R 777 /var/www/nZEDb/www

chmod 777 /var/www/nZEDb/configuration/
chmod 777 /var/www/nZEDb/www/install 

# REMOVE 
chmod -R 777 /var/www/nZEDb

chmod 777 -R /var/lib/php/sessions

# Enable nZEDb website 
sudo a2dissite 000-default
sudo a2ensite nZEDb.conf
sudo a2enmod rewrite
sudo service apache2 restart

