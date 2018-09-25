#!/bin/bash
set -e


# Only build allegro DB
if [ "$1" = "init_allegro" ]
then
    echo "---> Building DB for allegro ..."

    echo "---> Init allegro db  ..."
    flask/bin/python init_allegro.py

fi

if [ "$2" = "build_db" ]
then
    echo "---> Building DB for frontend ..."

    if [ -d "/Frontend/INNUENDO_REST_API/migrations" ]; then
        echo "---> Removing migrations  ..."
        rm -r /Frontend/INNUENDO_REST_API/migrations
    fi

    echo "---> Init DB  ..."
    /Frontend/INNUENDO_REST_API/manage.py db init --multidb

    echo "---> Migrate DB  ..."
    /Frontend/INNUENDO_REST_API/manage.py db migrate

    echo "---> Upgrade DB  ..."
    /Frontend/INNUENDO_REST_API/manage.py db upgrade

fi

# build DBs and launch frontend
if [ "$3" = "init_app" ]
then

    echo "---> Updating repository  ..."
    git pull

    echo "---> Launch worker  ..."
    /Frontend/INNUENDO_REST_API/worker.py &

    echo "---> Launch app  ..."
    /Frontend/INNUENDO_REST_API/run.py &

    tail -f /dev/null

fi
