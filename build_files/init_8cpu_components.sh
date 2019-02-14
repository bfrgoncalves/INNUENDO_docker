#!/bin/bash

: '
Script that allows setting up the initial protocols, workflows, and tets projects
for at least 8 cpu machines.

Before using this script, delete any entry from the allegrograph database or
the innuendo_general database.

Access allegrograph at http://localhost:10035, enter the credentials and delete
 all statements from the innuendo repository.

 To delete entries from the innuendo general database, enter inside the
innuendo_docker_db_innuendo_1 container and type:
    - psql -U innuendo innuendo
    - DROP SCHEMA public CASCADE;
    - CREATE SCHEMA public;

After the above steps you can build the database with other data.

Requires:
    - docker running
    - docker-compose version of the INNUENDO Platform running
'
# The bellow backup data is available at ./inputs/backups/initial
# Have infomration on protocols, workflows, and test projects

# Build innuendo general database with protocols and workflows compatible with
# 8 cpu machines
docker exec innuendo_docker_frontend_1 backup_dbs.sh build innuendo innuendo innuendo_database initial/initial_compose_general

# Populate Allegrograph with the data for the protocols and workflows compatible
# with 8 cpu machines
docker exec innuendo_docker_frontend_1 build_allegro.py build initial/initial_compose_allegro
