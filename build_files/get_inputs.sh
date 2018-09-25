#!/bin/bash

: '
Script that allows to fetch the legacy input files and build the database of
wgMLST profiles.
Requires:
    - docker running
    - docker-compose version of the INNUENDO Platform running
'

# Get schemas
docker exec slurmctld get_profiles_and_training.sh v1

# Build indexes
docker exec innuendo_docker_frontend_1 build_indexes.sh v1

# Populate DBs
docker exec innuendo_docker_frontend_1 populate_dbs.sh v1