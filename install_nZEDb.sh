# Install nZEDb.sh



# Install unrar
mkdir -p ~/new_unrar && cd ~/new_unrar
wget http://www.rarlab.com/rar/rarlinux-x64-5.2.1.tar.gz
tar -xzf rarlinux*.tar.gz
sudo mv rar/unrar /usr/bin/unrar
sudo chmod 755 /usr/bin/unrar
cd ~/ && rm -rf ~/new_unrar

# Install libzen0 libmediainfo mediainfo
wget http://mediaarea.net/download/binary/libzen0/0.4.35/libzen0_0.4.35-1_amd64.xUbuntu_14.10.deb
wget http://mediaarea.net/download/binary/libmediainfo0/0.7.94/libmediainfo0_0.7.94-1_amd64.xUbuntu_14.10.deb
wget http://mediaarea.net/download/binary/mediainfo/0.7.99/mediainfo_0.7.99-1_amd64.xUbuntu_14.04.deb
sudo dpkg -i libzen0_0.4.35-1_amd64.xUbuntu_14.10.deb
sudo dpkg -i libmediainfo0_0.7.94-1_amd64.xUbuntu_14.10.deb
sudo dpkg -i mediainfo_0.7.99-1_amd64.xUbuntu_14.04.deb
sudo apt-get install libzen0
sudo apt-get install lame
sudo apt-get install libav-tools
sudo apt-get install -f 

# Install php_yenc_decode
cd ~/
git clone https://github.com/kevinlekiller/simple_php_yenc_decode
cd simple_php_yenc_decode/
sh ubuntu.sh
cd ~/
rm -rf simple_php_yenc_decode/

# Enable nZEDb website 
sudo a2dissite 000-default
sudo a2ensite nZEDb.conf
sudo a2enmod rewrite
sudo service apache2 restart

# Step 11 Acquiring nZEDb
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

sudo chmod -R 755 /var/www/nZEDb/app/libraries
sudo chmod -R 755 /var/www/nZEDb/libraries
sudo chmod -R 777 /var/www/nZEDb/resources
sudo chmod -R 777 /var/www/nZEDb/www
