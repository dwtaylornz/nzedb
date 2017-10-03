# v 1.01
FROM ubuntu:14.04
MAINTAINER dwtaylornz@gmail.com

# Install Pre-reqs
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y software-properties-common python-software-properties git 
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update 
RUN apt-get install -y php-pear php-imagick php7.0 php7.0-cli php7.0-dev php7.0-common php7.0-curl php7.0-json php7.0-gd php7.0-mysql php7.0-mbstring php7.0-mcrypt php7.0-xml
#export DEBIAN_FRONTEND="noninteractive"
#sudo debconf-set-selections <<< "mariadb-server mysql-server/root_password password $PASSWORD"
#sudo debconf-set-selections <<< "mariadb-server mysql-server/root_password_again password $PASSWORD"
RUN apt-get install -y unrar wget p7zip-full
RUN apt-get install -y mariadb-server mariadb-client libmysqlclient-dev

# Add Files
ADD php-cli.ini /etc/php/7.0/cli/
ADD php-web.ini /etc/php/7.0/apache2/
ADD my.cnf /etc/mysql/
ADD apache2.conf /etc/apache2/
ADD nZEDb.conf /etc/apache2/sites-available/

# Add nZEDb Start-up
ADD start_nZEDb.sh /

# Install nZEDb
ADD install_nZEDb.sh /
# RUN bash /install_nZEDb.sh

# Volumes
#VOLUME /var/lib/unifi-video  

# Ports
EXPOSE 80

# start nZEDb
CMD ["sh","/start_nZEDb.sh"]
