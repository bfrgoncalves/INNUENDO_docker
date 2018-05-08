#!/bin/bash

# Enter schemas directory
cd /Controller/inputs/schemas/

# Get Salmonella enterica schema
if [ ! -d "/INNUENDO/inputs/schemas/schema_Salmonella_Py3" ]; then
    echo "---> Downloading Salmonella enterica schema  ..."
    cd /INNUENDO/inputs/schemas/
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/Salmonella_schema.tar.gz
    echo "---> Extracting Salmonella enterica schema  ..."
    tar zxf Salmonella_schema.tar.gz
    rm -rf Salmonella_schema.tar.gz
fi

# Get Yersinia enterocolitica schema
if [ ! -d "/INNUENDO/inputs/schemas/schema_Yenterocolitica_Py3" ]; then
    echo "---> Downloading Yersinia enterocolitica schema  ..."
    cd /INNUENDO/inputs/schemas/
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/Yenterocolitica_schema.tar.gz
    echo "---> Extracting Yersinia enterocolitica schema  ..."
    tar zxf Yenterocolitica_schema.tar.gz
    rm -rf Yenterocolitica_schema.tar.gz
fi

# Get Escherichia coli schema
if [ ! -d "/INNUENDO/inputs/schemas/schema_ecoli_Py3" ]; then
    echo "---> Downloading Escherichia coli schema  ..."
    cd /INNUENDO/inputs/schemas/
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/Ecoli_schema.tar.gz
    echo "---> Extracting Escherichia coli schema  ..."
    tar zxf Ecoli_schema.tar.gz
    rm -rf Ecoli_schema.tar.gz
fi

# Get Campylobacter jejuni/coli schema
if [ ! -d "/INNUENDO/inputs/schemas/ccoli_cjejuni_Py3" ]; then
    echo "---> Downloading Campylobacter jejuni/coli schema  ..."
    cd /INNUENDO/inputs/schemas/
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/ccolicjejuni.tar.gz
    echo "---> Extracting Campylobacter jejuni/coli schema  ..."
    tar zxf ccolicjejuni.tar.gz
    rm -rf ccolicjejuni.tar.gz
fi