FROM ubuntu:16.04
MAINTAINER dwtaylornz@gmail.com

# Install Pre-reqs
RUN apt-get update && apt-get install -y \
  apache2 apache2-utils

RUN systemctl enable apache2
RUN chown www-data /var/www/html/ -R

# Install PHP 
RUN apt-get –f install -y php7.0-fpm php7.0-mysql php7.0-common php7.0-gd php7.0-json php7.0-cli php7.0-curl libapache2-mod-php7.0
RUN a2enmod php7.0
RUN systemctl restart apache2
RUN apt-get –f install

# Install Tools
RUN apt-get install -y time unrar-free p7zip-full mediainfo lame ffmpeg libav-tools

# Install unrar
RUN mkdir -p ~/new_unrar && cd ~/new_unrar
RUN wget http://www.rarlab.com/rar/rarlinux-x64-5.5.0.tar.gz
RUN tar -xzf rarlinux*.tar.gz
RUN mv /usr/bin/unrar /usr/bin/unrar4
RUN mv rar/unrar /usr/bin/unrar
RUN chmod 755 /usr/bin/unrar
RUN cd ~/ && rm -rf ~/new_unrar

# Add NVR Start-up
ADD start_nZEDb.sh /

# Install NVR
ADD install_nZEDb.sh /
RUN bash /install_nZEDb.sh

# Volumes
#VOLUME /var/lib/unifi-video  

# Ports
EXPOSE 80

# start NVR
CMD ["sh","/start_nZEDb.sh"]
