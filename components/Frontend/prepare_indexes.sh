#!/bin/bash

# Enter INNUENDO REST directory
cd /Frontend/INNUENDO_REST_API

# Prepare Yersinia enterocolitica data
echo "---> Checking Yersinia enterocolitica data  ..."

if [ ! -f "/INNUENDO/inputs/legacy_profiles/profiles_Yersinia.tsv" ]; then

    echo "---> Downloading legacy dataset  ..."
    cd /INNUENDO/inputs/legacy_profiles
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/profiles_Yersinia.tsv
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/Yersinia_enterocolitica_metadata.txt
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/cgMLST_list_Yersinia.txt
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/goeBURST_cgMLST_7_133_yersinia.txt.1
    mv Yersinia_enterocolitica_metadata.txt ../legacy_metadata/
    mv goeBURST_cgMLST_7_133_yersinia.txt.1 ../classifications/goeBURST_cgMLST_7_133_yersinia.txt

    cd /Frontend/INNUENDO_REST_API

    echo "---> Parsing mlst profiles file  ..."
    python extract_core_from_wg.py -i /INNUENDO/inputs/legacy_profiles/profiles_Yersinia.tsv -g /INNUENDO/inputs/legacy_profiles/cgMLST_list_Yersinia.txt -o /INNUENDO/inputs/legacy_profiles/results_alleles_yersinia_wg --inverse --onlyreplace

    echo "---> Extracting mlst profiles ..."
    python extract_core_from_wg.py -i /INNUENDO/inputs/legacy_profiles/profiles_Yersinia.tsv -g /INNUENDO/inputs/legacy_profiles/cgMLST_list_Yersinia.txt -o /INNUENDO/inputs/legacy_profiles/results_alleles_yersinia_core --inverse

    echo "---> Copying profiles headers files ..."
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_yersinia_core_headers.txt /INNUENDO/inputs/core_lists/yersinia_headers_core.txt
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_yersinia_wg_headers.txt /INNUENDO/inputs/core_lists/yersinia_headers_wg.txt

    echo "---> Copying initial profile files for index build ..."
    rm /INNUENDO/inputs/indexes/yersinia_wg_profiles.tab
    rm /INNUENDO/inputs/indexes/yersinia_core_profiles.tab
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_yersinia_core.tsv /INNUENDO/inputs/indexes/yersinia_core_profiles.tab
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_yersinia_wg.tsv /INNUENDO/inputs/indexes/yersinia_wg_profiles.tab

    echo "---> Building profile file index ..."
    rm /INNUENDO/inputs/indexes/yersinia_core.idx
    rm /INNUENDO/inputs/indexes/yersinia_wg.idx
    rm /INNUENDO/inputs/indexes/yersinia_core.ids
    rm /INNUENDO/inputs/indexes/yersinia_wg.ids
    cat /INNUENDO/inputs/indexes/yersinia_core_profiles.tab | ../fast-mlst/src/main -i /INNUENDO/inputs/indexes/yersinia_core -b
    cat /INNUENDO/inputs/indexes/yersinia_wg_profiles.tab | ../fast-mlst/src/main -i /INNUENDO/inputs/indexes/yersinia_wg -b

    echo "---> Populating Profile Database ..."
    flask/bin/python mlst_profiles_to_db.py -i /INNUENDO/inputs/legacy_profiles/profiles_Yersinia.tsv -c /INNUENDO/inputs/classifications/goeBURST_cgMLST_7_133_yersinia.txt -m /INNUENDO/inputs/legacy_metadata/Yersinia_enterocolitica_metadata.txt -d yersinia -p NFP

fi

# Prepare Salmonella data
echo "---> Checking Salmonella enterica data  ..."

if [ ! -f "/INNUENDO/inputs/legacy_profiles/profiles_Salmonella.tsv" ]; then

    echo "---> Downloading legacy dataset  ..."
    cd /INNUENDO/inputs/legacy_profiles
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/profiles_Salmonella.tsv
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/Salmonella_enterica_metadata.txt
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/cgMLST_list_Salmonella.txt
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/goeBURST_cgMLST_7_338_salmonella.txt.1
    mv Salmonella_enterica_metadata.txt ../legacy_metadata/
    mv goeBURST_cgMLST_7_338_salmonella.txt.1 ../classifications/goeBURST_cgMLST_7_338_salmonella.txt

    cd /Frontend/INNUENDO_REST_API

    echo "---> Parsing mlst profiles file  ..."
    python extract_core_from_wg.py -i /INNUENDO/inputs/legacy_profiles/profiles_Salmonella.tsv -g /INNUENDO/inputs/legacy_profiles/cgMLST_list_Salmonella.txt -o /INNUENDO/inputs/legacy_profiles/results_alleles_salmonella_wg --inverse --onlyreplace

    echo "---> Extracting mlst profiles ..."
    python extract_core_from_wg.py -i /INNUENDO/inputs/legacy_profiles/profiles_Salmonella.tsv -g /INNUENDO/inputs/legacy_profiles/cgMLST_list_Salmonella.txt -o /INNUENDO/inputs/legacy_profiles/results_alleles_salmonella_core --inverse

    echo "---> Copying profiles headers files ..."
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_salmonella_core_headers.txt /INNUENDO/inputs/core_lists/salmonella_headers_core.txt
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_salmonella_wg_headers.txt /INNUENDO/inputs/core_lists/salmonella_headers_wg.txt

    echo "---> Copying initial profile files for index build ..."
    rm /INNUENDO/inputs/indexes/salmonella_wg_profiles.tab
    rm /INNUENDO/inputs/indexes/salmonella_core_profiles.tab
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_salmonella_core.tsv /INNUENDO/inputs/indexes/salmonella_core_profiles.tab
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_salmonella_wg.tsv /INNUENDO/inputs/indexes/salmonella_wg_profiles.tab

    echo "---> Building profile file index ..."
    rm /INNUENDO/inputs/indexes/salmonella_core.idx
    rm /INNUENDO/inputs/indexes/salmonella_wg.idx
    rm /INNUENDO/inputs/indexes/salmonella_core.ids
    rm /INNUENDO/inputs/indexes/salmonella_wg.ids
    cat /INNUENDO/inputs/indexes/salmonella_core_profiles.tab | ../fast-mlst/src/main -i /INNUENDO/inputs/indexes/salmonella_core -b
    cat /INNUENDO/inputs/indexes/salmonella_wg_profiles.tab | ../fast-mlst/src/main -i /INNUENDO/inputs/indexes/salmonella_wg -b

    echo "---> Populating Profile Database ..."
    flask/bin/python mlst_profiles_to_db.py -i /INNUENDO/inputs/legacy_profiles/profiles_Salmonella.tsv -c /INNUENDO/inputs/classifications/goeBURST_cgMLST_7_338_salmonella.txt -m /INNUENDO/inputs/legacy_metadata/Salmonella_enterica_metadata.txt -d salmonella -p NFP

fi

# Prepare Escherichia coli data
echo "---> Checking Escherichia coli data  ..."

if [ ! -f "/INNUENDO/inputs/legacy_profiles/profiles_Ecoli.tsv" ]; then

    echo "---> Downloading legacy dataset  ..."
    cd /INNUENDO/inputs/legacy_profiles
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/profiles_Ecoli.tsv
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/Escherichia_coli_metadata.txt
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/cgMLST_list_Ecoli.txt
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/goeBURST_FULL_7_112_ecoli.txt
    mv Escherichia_coli_metadata.txt ../legacy_metadata/
    mv goeBURST_FULL_7_112_ecoli.txt ../classifications/goeBURST_FULL_7_112_ecoli.txt

    cd /Frontend/INNUENDO_REST_API

    echo "---> Parsing mlst profiles file  ..."
    python extract_core_from_wg.py -i /INNUENDO/inputs/legacy_profiles/profiles_Ecoli.tsv -g /INNUENDO/inputs/legacy_profiles/cgMLST_list_Ecoli.txt -o /INNUENDO/inputs/legacy_profiles/results_alleles_ecoli_wg --inverse --onlyreplace

    echo "---> Extracting mlst profiles ..."
    python extract_core_from_wg.py -i /INNUENDO/inputs/legacy_profiles/profiles_Ecoli.tsv -g /INNUENDO/inputs/legacy_profiles/cgMLST_list_Ecoli.txt -o /INNUENDO/inputs/legacy_profiles/results_alleles_ecoli_core --inverse

    echo "---> Copying profiles headers files ..."
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_ecoli_core_headers.txt /INNUENDO/inputs/core_lists/ecoli_headers_core.txt
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_ecoli_wg_headers.txt /INNUENDO/inputs/core_lists/ecoli_headers_wg.txt

    echo "---> Copying initial profile files for index build ..."
    rm /INNUENDO/inputs/indexes/ecoli_wg_profiles.tab
    rm /INNUENDO/inputs/indexes/ecoli_core_profiles.tab
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_ecoli_core.tsv /INNUENDO/inputs/indexes/ecoli_core_profiles.tab
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_ecoli_wg.tsv /INNUENDO/inputs/indexes/ecoli_wg_profiles.tab

    echo "---> Building profile file index ..."
    rm /INNUENDO/inputs/indexes/ecoli_core.idx
    rm /INNUENDO/inputs/indexes/ecoli_wg.idx
    rm /INNUENDO/inputs/indexes/ecoli_core.ids
    rm /INNUENDO/inputs/indexes/ecoli_wg.ids
    cat /INNUENDO/inputs/indexes/ecoli_core_profiles.tab | ../fast-mlst/src/main -i /INNUENDO/inputs/indexes/ecoli_core -b
    cat /INNUENDO/inputs/indexes/ecoli_wg_profiles.tab | ../fast-mlst/src/main -i /INNUENDO/inputs/indexes/ecoli_wg -b

    echo "---> Populating Profile Database ..."
    flask/bin/python mlst_profiles_to_db.py -i /INNUENDO/inputs/legacy_profiles/profiles_Ecoli.tsv -c /INNUENDO/inputs/classifications/goeBURST_FULL_7_112_ecoli.txt -m /INNUENDO/inputs/legacy_metadata/Escherichia_coli_metadata.txt -d ecoli -p NFP

fi

# Prepare Campylobacter jejuni/coli data
echo "---> Checking Campylobacter jejuni/coli data  ..."

if [ ! -f "/INNUENDO/inputs/legacy_profiles/profiles_CcoliCjejuni.tsv" ]; then

    echo "---> Downloading legacy dataset  ..."
    cd /INNUENDO/inputs/legacy_profiles
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/profiles_CcoliCjejuni.tsv
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/Campylobacter_coli_jejuni_metadata.txt
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/cgMLST_list_ccolicjejuni.tsv
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/goeBURST_cgMLST_4_59_campy.txt
    mv Campylobacter_coli_jejuni_metadata.txt ../legacy_metadata/
    mv goeBURST_cgMLST_4_59_campy.txt ../classifications/goeBURST_cgMLST_4_59_campy.txt

    cd /Frontend/INNUENDO_REST_API

    echo "---> Parsing mlst profiles file  ..."
    python extract_core_from_wg.py -i /INNUENDO/inputs/legacy_profiles/profiles_CcoliCjejuni.tsv -g /INNUENDO/inputs/legacy_profiles/cgMLST_list_ccolicjejuni.tsv -o /INNUENDO/inputs/legacy_profiles/results_alleles_campy_wg --inverse --onlyreplace

    echo "---> Extracting mlst profiles ..."
    python extract_core_from_wg.py -i /INNUENDO/inputs/legacy_profiles/profiles_CcoliCjejuni.tsv -g /INNUENDO/inputs/legacy_profiles/cgMLST_list_ccolicjejuni.tsv -o /INNUENDO/inputs/legacy_profiles/results_alleles_campy_core --inverse

    echo "---> Copying profiles headers files ..."
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_campy_core_headers.txt /INNUENDO/inputs/core_lists/campy_headers_core.txt
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_campy_wg_headers.txt /INNUENDO/inputs/core_lists/campy_headers_wg.txt

    echo "---> Copying initial profile files for index build ..."
    rm /INNUENDO/inputs/indexes/campy_wg_profiles.tab
    rm /INNUENDO/inputs/indexes/campy_core_profiles.tab
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_campy_core.tsv /INNUENDO/inputs/indexes/campy_core_profiles.tab
    cp /INNUENDO/inputs/legacy_profiles/results_alleles_campy_wg.tsv /INNUENDO/inputs/indexes/campy_wg_profiles.tab

    echo "---> Building profile file index ..."
    rm /INNUENDO/inputs/indexes/campy_core.idx
    rm /INNUENDO/inputs/indexes/campy_wg.idx
    rm /INNUENDO/inputs/indexes/campy_core.ids
    rm /INNUENDO/inputs/indexes/campy_wg.ids
    cat /INNUENDO/inputs/indexes/campy_core_profiles.tab | ../fast-mlst/src/main -i /INNUENDO/inputs/indexes/campy_core -b
    cat /INNUENDO/inputs/indexes/campy_wg_profiles.tab | ../fast-mlst/src/main -i /INNUENDO/inputs/indexes/campy_wg -b

    echo "---> Populating Profile Database ..."
    flask/bin/python mlst_profiles_to_db.py -i /INNUENDO/inputs/legacy_profiles/profiles_CcoliCjejuni.tsv -c /INNUENDO/inputs/classifications/goeBURST_cgMLST_4_59_campy.txt -m /INNUENDO/inputs/legacy_metadata/Campylobacter_coli_jejuni_metadata.txt -d campylobacter -p NFP

fi