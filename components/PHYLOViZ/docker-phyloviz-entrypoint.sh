#!/bin/bash
set -e

# Only build DB
if [ "$1" = "init_all" ]
then

    echo "---> Launch redis-server  ..."
    redis-server &

    echo "---> Start pm2 for app.js  ..."
    pm2 start app.js -i 1

    echo "---> Start pm2 for queue_worker.js  ..."
    pm2 start queue_worker.js -i 1

    echo "---> Start DB if required ..."
    sleep 40
    curl http://web:82/api/db/postgres/init

    tail -f /dev/null

fi
