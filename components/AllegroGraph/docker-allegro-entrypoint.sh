#!/bin/bash
set -e

# Only build DB
if [ "$1" = "init_all" ]
then

    echo "---> Launch allegroGraph  ..."
    /Allegrograph/agraph/bin/agraph-control --config /Allegrograph/agraph/lib/agraph.cfg start && tail -f /dev/null

fi
