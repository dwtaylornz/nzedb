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
sudo apt-get install -y libzen0 lame libav-tools

# Install php_yenc_decode
cd ~/
git clone https://github.com/kevinlekiller/simple_php_yenc_decode
cd simple_php_yenc_decode/
sh ubuntu.sh
cd ~/
rm -rf simple_php_yenc_decode/
