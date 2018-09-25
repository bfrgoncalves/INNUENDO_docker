#!/bin/bash

# Populate wgMLST databases with the available legacy strains and
# classifications

# RUN on INNUENDO_REST_API folder

innuendo_dir=$(pwd)

# INNUENDO DIR
echo "INNUENDO dir: ${innuendo_dir}"

# Allegrograph client
export PYTHONPATH="${innuendo_dir}/agraph-6.2.1-client-python/src"

# Schema version
echo "schema version: ${1}"


echo "---> Checking Yersinia enterocolitica data  ..."

if [ -f "/INNUENDO/inputs/${1}/legacy_profiles/profiles_Yersinia.tsv" ]; then

    echo "---> Populating Profile Database ..."
    flask/bin/python mlst_profiles_to_db.py -i /INNUENDO/inputs/${1}/legacy_profiles/profiles_Yersinia.tsv -c /INNUENDO/inputs/${1}/classifications/goeBURST_cgMLST_9_133_1189_yersinia.txt -m /INNUENDO/inputs/${1}/legacy_metadata/Yersinia_enterocolitica_metadata.txt -d yersinia -p NFP -v ${1}
fi


echo "---> Checking Salmonella enterica data  ..."

if [ -f "/INNUENDO/inputs/${1}/legacy_profiles/profiles_Salmonella.tsv" ]; then

    echo "---> Populating Profile Database ..."
    flask/bin/python mlst_profiles_to_db.py -i /INNUENDO/inputs/${1}/legacy_profiles/profiles_Salmonella.tsv -c /INNUENDO/inputs/${1}/classifications/goeBURST_cgMLST_7_338_997_salmonella.txt -m /INNUENDO/inputs/${1}/legacy_metadata/Salmonella_enterica_metadata.txt -d salmonella -p NFP -v ${1}
fi


echo "---> Checking Escherichia coli data  ..."

if [ -f "/INNUENDO/inputs/${1}/legacy_profiles/profiles_Ecoli.tsv" ]; then

    echo "---> Populating Profile Database ..."
    flask/bin/python mlst_profiles_to_db.py -i /INNUENDO/inputs/${1}/legacy_profiles/profiles_Ecoli.tsv -c /INNUENDO/inputs/${1}/classifications/goeBURST_FULL_8_112_793_ecoli.txt -m /INNUENDO/inputs/${1}/legacy_metadata/Escherichia_coli_metadata.txt -d ecoli -p NFP -v ${1}
fi


echo "---> Checking Campylobacter jejuni data  ..."

if [ -f "/INNUENDO/inputs/${1}/legacy_profiles/profiles_Cjejuni.tsv" ]; then

    echo "---> Populating Profile Database ..."
    flask/bin/python mlst_profiles_to_db.py -i /INNUENDO/inputs/${1}/legacy_profiles/profiles_Cjejuni.tsv -c /INNUENDO/inputs/${1}/classifications/goeBURST_cgMLST_4_59_292_campy.txt -m /INNUENDO/inputs/${1}/legacy_metadata/Campylobacter_jejuni_metadata.txt -d campylobacter -p NFP -v ${1}
fi