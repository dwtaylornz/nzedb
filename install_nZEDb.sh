# Install nZEDb.sh
cd /var/www
git clone https://github.com/nZEDb/nZEDb.git


sudo chgrp www-data nZEDb
sudo chmod 775 nZEDb
cd nZEDb
sudo chmod -R 755 .
sudo chgrp www-data /var/www/nZEDb/resources/smarty/templates_c
sudo chmod 775 /var/www/nZEDb/resources/smarty/templates_c
sudo chgrp -R www-data /var/www/nZEDb/resources/covers
sudo chmod -R 775 /var/www/nZEDb/resources/covers
sudo chgrp www-data /var/www/nZEDb/www
sudo chmod 775 /var/www/nZEDb/www
sudo chgrp www-data /var/www/nZEDb/www/install
sudo chmod 775 /var/www/nZEDb/www/install
sudo chgrp -R www-data /var/www/nZEDb/resources/nzb
sudo chmod -R 775 /var/www/nZEDb/resources/nzb

composer install --no-dev --keep-vcs --prefer-source

