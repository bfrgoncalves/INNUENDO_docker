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

    echo "---> Parsing bad formatted alleles  ..."
    cd /INNUENDO/inputs/schemas/schema_Salmonella_Py3
    grep -P "[\x80-\xFF]" *.fasta | cut -f1 -d":" > bad_files.txt
    for i in `cat bad_files.txt`; do echo $i; cat ${i} | tr -d '\200-\377' > ${i}.mod; done
    for i in `ls *.mod`; do mv $i ${i%.mod}; done

    find /INNUENDO/inputs/schemas/schema_Salmonella_Py3/*.fasta > listGenes.txt

fi

# Get Yersinia enterocolitica schema
if [ ! -d "/INNUENDO/inputs/schemas/schema_Yenterocolitica_Py3" ]; then

    echo "---> Downloading Yersinia enterocolitica schema  ..."
    cd /INNUENDO/inputs/schemas/
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/Yenterocolitica_schema.tar.gz

    echo "---> Extracting Yersinia enterocolitica schema  ..."
    tar zxf Yenterocolitica_schema.tar.gz
    rm -rf Yenterocolitica_schema.tar.gz

    echo "---> Parsing bad formatted alleles  ..."
    cd /INNUENDO/inputs/schemas/schema_Yenterocolitica_Py3
    grep -P "[\x80-\xFF]" *.fasta | cut -f1 -d":" > bad_files.txt
    for i in `cat bad_files.txt`; do echo $i; cat ${i} | tr -d '\200-\377' > ${i}.mod; done
    for i in `ls *.mod`; do mv $i ${i%.mod}; done

    find /INNUENDO/inputs/schemas/schema_Yenterocolitica_Py3/*.fasta > listGenes.txt
fi

# Get Escherichia coli schema
if [ ! -d "/INNUENDO/inputs/schemas/schema_ecoli_Py3" ]; then

    echo "---> Downloading Escherichia coli schema  ..."
    cd /INNUENDO/inputs/schemas/
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/Ecoli_schema.tar.gz

    echo "---> Extracting Escherichia coli schema  ..."
    tar zxf Ecoli_schema.tar.gz
    rm -rf Ecoli_schema.tar.gz

    echo "---> Parsing bad formatted alleles  ..."
    cd /INNUENDO/inputs/schemas/schema_ecoli_Py3
    grep -P "[\x80-\xFF]" *.fasta | cut -f1 -d":" > bad_files.txt
    for i in `cat bad_files.txt`; do echo $i; cat ${i} | tr -d '\200-\377' > ${i}.mod; done
    for i in `ls *.mod`; do mv $i ${i%.mod}; done

    find /INNUENDO/inputs/schemas/schema_ecoli_Py3/*.fasta > listGenes.txt
fi

# Get Campylobacter jejuni/coli schema
if [ ! -d "/INNUENDO/inputs/schemas/ccoli_cjejuni_Py3" ]; then

    echo "---> Downloading Campylobacter jejuni/coli schema  ..."
    cd /INNUENDO/inputs/schemas/
    wget https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/v1.0/ccolicjejuni.tar.gz

    echo "---> Extracting Campylobacter jejuni/coli schema  ..."
    tar zxf ccolicjejuni.tar.gz
    rm -rf ccolicjejuni.tar.gz

    echo "---> Parsing bad formatted alleles  ..."
    cd /INNUENDO/inputs/schemas/ccoli_cjejuni_Py3
    grep -P "[\x80-\xFF]" *.fasta | cut -f1 -d":" > bad_files.txt
    for i in `cat bad_files.txt`; do echo $i; cat ${i} | tr -d '\200-\377' > ${i}.mod; done
    for i in `ls *.mod`; do mv $i ${i%.mod}; done

    find /INNUENDO/inputs/schemas/ccoli_cjejuni_Py3/*.fasta > listGenes.txt
fi

count_p=$(ls /INNUENDO/inputs/prodigal_training_files | wc -l)

# Get Prodigal training files
if [ $count_p -eq 1 ]; then

    echo "---> Downloading prodigal training file  ..."
    cd /INNUENDO/inputs/prodigal_training_files
    git clone https://github.com/mickaelsilva/prodigal_training_files.git

fi

count_s=$(ls /INNUENDO/inputs/serotyping_files | wc -l)

# Get Serotyping files
if [ $count_s -eq 1 ]; then

    echo "---> Downloading serotyping files  ..."
    cd /INNUENDO/inputs/serotyping_files
    mkdir escherichia_coli
    cd escherichia_coli
    wget https://raw.githubusercontent.com/B-UMMI/seq_typing/master/serotyping_reference_sequences/escherichia_coli/1_O_type.fasta
    wget https://raw.githubusercontent.com/B-UMMI/seq_typing/master/serotyping_reference_sequences/escherichia_coli/2_H_type.fasta

fi
