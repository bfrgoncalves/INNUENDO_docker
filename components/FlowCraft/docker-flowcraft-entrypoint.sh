#!/bin/bash

if [ "$1" = "init_all" ]
then
    redis-server &
    cd flowcraft-webapp
    yarn install
    python3 manage.py makemigrations
    python3 manage.py migrate
    yarn run build
    echo "static"
    python3 manage.py collectstatic
    python3 manage.py runserver 0.0.0.0:81 &

    tail -f /dev/null
fi