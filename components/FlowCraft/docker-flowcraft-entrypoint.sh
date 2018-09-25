#!/bin/bash

if [ "$1" = "init_all" ]
then
    git pull
    redis-server &
    cd flowcraft-webapp
    yarn install
    python3 manage.py makemigrations
    python3 manage.py migrate
    yarn run build
    python3 manage.py runserver 0.0.0.0:6000 &

    tail -f /dev/null
fi