import os
basedir = os.path.abspath(os.path.dirname("__file__"))

# CONFIG file for INNUENDO Job Controller
REDIS_URL = 'redis://redis:6379'

# Folder for files with jobs
JOBS_FOLDER = 'job_processing/parameters_files'

# Files folder (FTP)
FTP_FILES_FOLDER = 'ftp/files'

# BLAST PATH
BLAST_PATH = '/home/ubuntu/ncbi-blast-2.6.0+/bin/blastp'

# Available applications
APPLICATIONS_ARRAY = [
    'INNUca',
    'chewBBACA',
    'PathoTyping'
]

FILETYPES_SOFTWARE = {
    'INNUca': [
        {
            'language': 'python',
            '-f': '.fastq',
            'app_path': 'dependencies/INNUca/',
            'path': 'dependencies/INNUca/INNUca.py'
        }
    ],
    'chewBBACA': [
        {
            'language': 'python',
            '-f': 'fasta',
            'app_path': 'dependencies/chewBBACA/',
            'path': 'dependencies/chewBBACA/allelecall/BBACA.py'
        }]
    ,
    'PathoTyping': [
        {
            'language': 'python',
            '-f': '.fastq',
            'app_path': 'dependencies/patho_typing/',
            'path': 'dependencies/patho_typing/patho_typing.py'
        }
    ]
}

SERVER_IP = 'web'
FRONTEND_SERVER_IP = 'web'

#######################SLURM CONF ##############

DEFAULT_SLURM_CPUS = '8'
NEXTFLOW_PROFILE = 'local'
NEXTFLOW_GENERATOR_PATH = '/Controller/assemblerflow/assemblerflow/assemblerflow.py'
NEXTFLOW_GENERATOR_RECIPE = 'innuendo'
FASTQPATH = "data/*_{1,2}.*"

JOBS_ROOT_SET_OUTPUT = 'http://'+SERVER_IP+'/jobs/setoutput/'
JOBS_ROOT_SET_REPORT = 'http://'+FRONTEND_SERVER_IP+'/app/api/v1.0/jobs/report/'

CHEWBBACA_SCHEMAS_PATH = '/INNUENDO/input/schemas'

CHEWBBACA_CORRESPONDENCE = {
    "E.coli": "Escherichia coli"
}

MLST_CORRESPONDENCE = {
    "E.coli": "ecoli"
}

SEQ_FILE_O = {
    "E.coli": "/mnt/singularity_cache/shared_files/Ecoli/O_type.fasta"
}

SEQ_FILE_H = {
    "E.coli": "/mnt/singularity_cache/shared_files/Ecoli/H_type.fasta"
}

##### DECODIFICATION OF DATABASES AND BASE METADATA FOR MLST DATABASE #########

allele_classes_to_ignore = {
    'LNF': '0',
    'INF-': '',
    'NIPHEM': '0',
    'NIPH': '0',
    'LOTSC': '0',
    'PLOT3': '0',
    'PLOT5': '0',
    'ALM': '0',
    'ASM': '0'
}

metadata_to_use = {
    'Uberstrain': 'strainID',
    'SourceType': 'Source',
    'Country': 'Country',
    'Serotype': 'Serotype',
    'Simple Patho': 'Pathotyping',
    'ST(Achtman 7 Gene)': 'ST'
}

base_metadata = {
    'strainID': "",
    "Source": "",
    "Country": "",
    "Serotype": "",
    "Pathotyping": "",
    "ST": ""
}

wg_index_correspondece = {
    "E.coli": "./chewbbaca_database_profiles/indexes/ecoli_wg.index"
}

core_index_correspondece = {
    "E.coli": "./chewbbaca_database_profiles/indexes/ecoli_core.index"
}

wg_headers_correspondece = {
    "E.coli": "./chewbbaca_database_profiles/profiles_headers/ecoli_headers_wg.txt"
}
core_headers_correspondece = {
    "E.coli": "/home/ubuntu/innuendo/INNUENDO_PROCESS_CONTROLLER/chewBBACA_core_files/ecoli/ecoli_headers_core.txt"
}

core_increment_profile_file_correspondece = {
    "E.coli": "./chewbbaca_database_profiles/indexes/ecoli_core_profiles.tab"
}

wg_increment_profile_file_correspondece = {
    "E.coli": "./chewbbaca_database_profiles/indexes/ecoli_wg_profiles.tab"
}

species_expected_genome_size = {
    "E.coli": "5",
    "Yersinia": "4.7"
}

##################  ALLEGROGRAPH CONFIGURATION  ###############################

# agraph config
CURRENT_DIRECTORY = os.getcwd()

AG_HOST = os.environ.get('AGRAPH_HOST', FRONTEND_SERVER_IP)
AG_PORT = int(os.environ.get('AGRAPH_PORT', '10035'))

AG_REPOSITORY = 'innuendo'
AG_USER = 'innuendo'
AG_PASSWORD = 'innuendo_allegro'

# List namespaces
obo = "http://purl.obolibrary.org/obo/"
dcterms="http://purl.org/dc/terms/"
edam ="http://edamontology.org#"
localNSpace="http://ngsonto.net/api/v1.0/"

pTypes = [
    'dnaextraction',
    'librarypreparation',
    'qualityControl',
    'sequencing',
    'trimming',
    'filtering',
    'mapping',
    'denovo',
    'allelecall',
    'pathotyping'
]

protocolsTypes =[
    'http://purl.obolibrary.org/obo/NGS_0000067',
    'http://purl.obolibrary.org/obo/NGS_0000068',
    'http://purl.obolibrary.org/obo/NGS_0000088',
    'http://purl.obolibrary.org/obo/NGS_0000072',
    'http://purl.obolibrary.org/obo/NGS_0000065',
    'http://purl.obolibrary.org/obo/NGS_0000066',
    'http://purl.obolibrary.org/obo/NGS_0000071',
    'http://purl.obolibrary.org/obo/NGS_0000070',
    'http://purl.obolibrary.org/obo/NGS_0000090',
    'http://purl.obolibrary.org/obo/NGS_0000100'
]

processTypes = [
    'http://purl.obolibrary.org/obo/OBI_0000257',
    'http://purl.obolibrary.org/obo/OBI_0000711',
    'http://edamontology.org/operation_3218',
    'http://purl.obolibrary.org/obo/OBI_0000626',
    'http://edamontology.org/operation_0369',
    'http://purl.obolibrary.org/obo/NGS_0000008',
    'http://edamontology.org/operation_0523',
    'http://edamontology.org/operation_0524',
    'http://purl.obolibrary.org/obo/NGS_0000098',
    'http://purl.obolibrary.org/obo/NGS_0000099'
]

processMessages =[
    'http://purl.obolibrary.org/obo/OBI_0001051',
    'http://purl.obolibrary.org/obo/NGS_0000001',
    'http://purl.obolibrary.org/obo/SO_0000150',
    'http://purl.obolibrary.org/obo/SO_0000150',
    'http://purl.obolibrary.org/obo/SO_0000150',
    'http://purl.obolibrary.org/obo/SO_0000150',
    'http://purl.obolibrary.org/obo/SO_0000149',
    'http://purl.obolibrary.org/obo/OBI_0001573',
    'http://purl.obolibrary.org/obo/OBI_0001305',
    'http://purl.obolibrary.org/obo/OBI_0001305'
]


protocolsTypes = dict(zip(pTypes, protocolsTypes))
processTypes = dict(zip(pTypes, processTypes))
processMessages = dict(zip(pTypes, processMessages))
