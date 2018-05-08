#!/bin/bash
set -e

# Prepare mlst metadata and indexes
if [ "$2" = "build_metadata_indexes" ]
then
    echo "---> Populating metadata DB and constructing indexes ..."
    /Frontend/INNUENDO_REST_API/prepare_indexes.sh


fi

# Only build DB
if [ "$1" = "build_db" ]
then
    echo "---> Building DB for frontend ..."

    echo "---> Init DB  ..."
    exec /Frontend/INNUENDO_REST_API/manage.py db init --multidb

    echo "---> Migrate DB  ..."
    exec /Frontend/INNUENDO_REST_API/manage.py db migrate

    echo "---> Upgrade DB  ..."
    exec /Frontend/INNUENDO_REST_API/manage.py db upgrade

fi

# Only build allegro DB
if [ "$1" = "build_allegro" ]
then
    echo "---> Building DB for allegro ..."

    echo "---> Init allegro db  ..."
    flask/bin/python build_allegro.py

fi

# Only launch frontend
if [ "$1" = "launch_app" ]
then

    echo "---> Pulling Frontend app ..."
    git pull

    echo "---> Launch app  ..."
    /Frontend/INNUENDO_REST_API/run.py

fi

# build DBs and launch frontend
if [ "$1" = "init_all" ]
then

    echo "---> Pulling Frontend app ..."
    #git pull

    echo "---> Building allegro database app ..."
    flask/bin/python build_allegro.py

    echo "---> Building DB for frontend ..."

    echo "---> Init DB  ..."

    if [ -d "/Frontend/INNUENDO_REST_API/migrations" ]; then
        echo "---> Removing migrations  ..."
        rm -r /Frontend/INNUENDO_REST_API/migrations
    fi

    echo "---> Initiating DB  ..."
    /Frontend/INNUENDO_REST_API/manage.py db init --multidb

    echo "---> Migrate DB  ..."
    /Frontend/INNUENDO_REST_API/manage.py db migrate

    echo "---> Upgrade DB  ..."
    /Frontend/INNUENDO_REST_API/manage.py db upgrade

    echo "---> Launch worker  ..."
    /Frontend/INNUENDO_REST_API/worker.py &

    echo "---> Launch app  ..."
    /Frontend/INNUENDO_REST_API/run.py

fi