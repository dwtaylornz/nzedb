FROM ubuntu:14.04
MAINTAINER dwtaylornz@gmail.com

# Install Pre-reqs
RUN apt-get update && apt-get install -y \
  python3-setuptools \
  python3-pip

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
