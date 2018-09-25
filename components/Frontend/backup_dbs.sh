#!/bin/bash

echo "mode: ${1}"
echo "database: ${2}"
echo "postgres username: ${3}"
echo "postgres pass: ${4}"
echo "backup file name: ${5}"

if [ "${2}" == "innuendo" ]
then
    host=db_innuendo
fi

if [ "${2}" == "mlst_database" ]
then
    host=db_mlst
fi

if [ "${2}" == "assemblerflow" ]
then
    host=db_flowcraft
fi

if [ "${2}" == "phyloviz" ]
then
    host=db_phyloviz
fi


if [ "${1}" == "build" ]
then
    echo "backup file path: ./inputs/backups"
    PGPASSWORD="${4}" psql -U ${3} ${2} -h ${host} < /INNUENDO/backups/${5}
fi

if [ "${1}" == "backup" ]
then
    echo "destination file path: ./inputs/backups"
    PGPASSWORD="${4}" pg_dump -U ${3} ${2} -h ${host} > /INNUENDO/backups/${5}
fi

