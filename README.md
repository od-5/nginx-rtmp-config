# Подготовка скриптов к запуску
```
adduser alexy
usermod -aG sudo alexy
su alexy
cd /home/alexy
sudo apt-get update
sudo apt-get install unzip
wget https://github.com/od-5/nginx-rtmp-config/archive/master.zip
unzip master.zip
nginx-rtmp-config-master/script_stream.sh

```
# в sudo crontab -e добавить
```
 */2 * * * * /home/alexy/stream/env/bin/python /home/alexy/stream/src/manage.    py stream_check
```
