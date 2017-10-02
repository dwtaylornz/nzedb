FROM ubuntu:14.04
MAINTAINER dwtaylornz@gmail.com

# Install Pre-reqs
RUN apt-get update && apt-get install -y \
  python3-setuptools \
  python3-pip \ 
  git \
  p7zip-full \
  par2
  
# Setup python 
RUN python3 -m easy_install pip && easy_install3 cymysql

# Setup Apache
RUN apt-get install -y apache2

# Install PHP
RUN apt-get install -y php5 php5-dev php-pear php5-gd php5-mysqlnd php5-curl

# Install unrar / ffmpeg / mediainfo / lame
RUN apt-get install -y software-properties-common unrar python-software-properties lame mediainfo

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
