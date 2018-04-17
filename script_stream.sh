#!/bin/bash

echo '---- install packet ----'
sudo apt-get install python-dev
sudo apt-get install python-pip
sudo apt-get install supervisor
sudo pip install --upgrade pip
sudo pip install virtualenv
mkdir stream
cd stream
virtualenv env
source env/bin/activate
pip install uwsgi
git clone https://rylcev_alexy@bitbucket.org/rylcev_alexy/stream.git src
mkdir static media log supervisor supervisor/logs src/static

cd src
pip install -r requirements.txt

echo '[program:stream_uwsgi]' > /home/alexy/strean/supervisor/production.conf
echo 'numprocs=1' > /home/alexy/strean/supervisor/production.conf
echo 'command=/home/alexy/stream/env/bin/uwsgi /home/alexy/stream/uwsgi.ini' > /home/alexy/strean/supervisor/production.conf
echo 'autostart=true' > /home/alexy/strean/supervisor/production.conf
echo 'autorestart=true' > /home/alexy/strean/supervisor/production.conf
echo 'redirect_stderr=true' > /home/alexy/strean/supervisor/production.conf
echo 'stopwaitsecs=60' > /home/alexy/strean/supervisor/production.conf
echo 'stopsignal=INT' > /home/alexy/strean/supervisor/production.conf
echo 'stderr_logfile=/home/alexy/stream/supervisor/logs/%(program_name)s_err.log' > /home/alexy/strean/supervisor/production.conf
echo 'stdout_logfile=/home/alexy/stream/supervisor/logs/%(program_name)s_out.log' > /home/alexy/strean/supervisor/production.conf
echo 'stdout_logfile_maxbytes=100MB' > /home/alexy/strean/supervisor/production.conf
echo 'stdout_logfile_backups=30' > /home/alexy/strean/supervisor/production.conf
echo 'stdout_capture_maxbytes=1MB' > /home/alexy/strean/supervisor/production.conf

echo '[uwsgi]' > /home/alexy/stream/uwsgi.ini
echo 'chdir = /home/alexy/stream/' > /home/alexy/stream/uwsgi.ini
echo 'wsgi-file = src/cms/wsgi.py' > /home/alexy/stream/uwsgi.ini
echo 'virtualenv = /home/alexy/stream/env' > /home/alexy/stream/uwsgi.ini
echo 'pythonpath = .' > /home/alexy/stream/uwsgi.ini
echo 'pythonpath = src ' > /home/alexy/stream/uwsgi.ini
echo 'master = true' > /home/alexy/stream/uwsgi.ini
echo 'processes = 5' > /home/alexy/stream/uwsgi.ini
echo 'max-requests = 5000' > /home/alexy/stream/uwsgi.ini
echo 'socket = /home/alexy/stream/mysite.sock' > /home/alexy/stream/uwsgi.ini
echo 'chmod-socket=666' > /home/alexy/stream/uwsgi.ini
echo 'daemonize = /home/alexy/stream/log/uwsgi.log' > /home/alexy/stream/uwsgi.ini
echo 'touch-reload = /home/alexy/stream/touch' > /home/alexy/stream/uwsgi.ini
