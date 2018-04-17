#!/bin/bash
echo 'add user alexy'
adduser alexy
usermod -aG sudo alexy
su alexy
cd /home/alexy/
sudo add-apt-repository ppa:jonathonf/ffmpeg-3
sudo apt-get update
sudo apt-get -y install libpcre3 libpcre3-dev libssl-dev unzip gcc make ffmpeg libav-tools x264 x265 git python-dev python-pip supervisor
wget http://nginx.org/download/nginx-1.12.2.tar.gz
tar -xzvf nginx-1.12.2.tar.gz 
wget https://github.com/arut/nginx-rtmp-module/zipball/master -O nginx-rtmp-module-master.zip
unzip nginx-rtmp-module-master.zip -d nginx-rtmp-module-master
cd nginx-1.12.2
./configure --prefix=/usr --add-module=../nginx-rtmp-module-master/arut-nginx-rtmp-module-43f1e42/ --pid-path=/var/run/nginx.pid --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-http_ssl_module --with-http_secure_link_module
make
sudo make install
cp ../nginx-rtmp-module-master/arut-nginx-rtmp-module-43f1e42/stat.xsl /etc/nginx/


echo '---- install packet ----'
cd /home/alexy/
mkdir stream stream/static stream/media/ stream/log stream/supervisor stream/supervisor/logs
cp nginx-rtmp-config-master/uwsgi.ini stream/
cp nginx-rtmp-config-master/production.conf stream/supervisor
sudo cp nginx-rtmp-config-master/nginx.conf /etc/nginx/
sudo mkdir /etc/nginx/camera
sudo cp nginx-rtmp-config-master/test.conf /etc/nginx/camera/
echo '---- install packet ----'
sudo pip install --upgrade pip
sudo pip install virtualenv
cd stream
virtualenv env
source env/bin/activate
pip install uwsgi
git clone https://rylcev_alexy@bitbucket.org/rylcev_alexy/stream.git src
cd src
pip install -r requirements.txt

