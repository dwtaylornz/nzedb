FROM ubuntu:14.04
MAINTAINER dwtaylornz@gmail.com

# Add Repo
#RUN add-apt-repository ppa:ondrej/php5-5.6

# Install Pre-reqs
#RUN apt-get update && apt-get install -y \
#  python3-setuptools \
#  python3-pip \ 
#  software-properties-common \
#  git
  
# Setup python 
#RUN python3 -m easy_install pip && easy_install3 cymysql

# Setup Apache
#RUN apt-get install -y apache2

# Install PHP
#RUN apt-get install -y php5.6 php5.6-mcrypt php5.6-mbstring php5.6-curl php5.6-cli php5.6-mysql php5.6-gd php5.6-intl php5.6-xsl php5.6-zip

# Install unrar / ffmpeg / mediainfo / lame
#RUN apt-get install -y software-properties-common unrar python-software-properties lame mediainfo

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
