# coding=utf-8

LOCAL_SETTINGS = True
from settings import *

ALLOWED_HOSTS = ['*']

DEBUG = True
ADMINS = (('Alexey', 'od-5@yandex.ru'),)
TEMPLATES[0]['OPTIONS']['debug'] = DEBUG
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
CAM_SECURE_KEY = 'secret'
STREAM_ROOT = '/mnt/data0/hls'
CMD_KEY = '490683'

