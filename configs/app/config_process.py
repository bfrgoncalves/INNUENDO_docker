import os
basedir = os.path.abspath(os.path.dirname("__file__"))

# CONFIG file for INNUENDO Job Controller
REDIS_URL = 'redis://redis:6379'

# Files folder (FTP)
FTP_FILES_FOLDER = 'ftp/files'
ASPERAKEY = "~/.aspera/connect/etc/asperaweb_id_dsa.openssh"

# Specific process resources specifications
NEXTFLOW_RESOURCES = {
    "reads_download": {
        "memory": r"\'2GB\'",
        "cpus": "2"
    },
    "integrity_coverage": {
        "memory": r"\'2GB\'",
        "cpus": "1"
    },
    "check_coverage": {
        "memory": r"\'2GB\'",
        "cpus": "1"
    },
    "fastqc": {
        "memory": r"\'2GB\'",
        "cpus": "2"
    },
    "trimmomatic": {
        "memory": "{2.GB*task.attempt}",
        "cpus": "2"
    },
    "fastqc_trimmomatic": {
        "memory": "{2.GB*task.attempt}",
        "cpus": "2"
    },
    "true_coverage": {
        "memory": r"\'1GB\'",
        "cpus": "2"
    },
    "spades": {
        "memory": "{2.GB*task.attempt}",
        "cpus": "2",
        "scratch": "true"
    },
    "process_spades": {
        "memory": r"\'2GB\'",
        "cpus": "1"
    },
    "assembly_mapping": {
        "memory": "{2.GB*task.attempt}",
        "cpus": "2"
    },
    "pilon": {
        "memory": "{2.GB*task.attempt}",
        "cpus": "2"
    },
    "mlst": {
        "memory": r"\'2GB\'",
        "cpus": "1",
        "version": "tuberfree"
    },
    "abricate": {
        "memory": r"\'2GB\'",
        "cpus": "1"
    },
    "prokka": {
        "memory": r"\'2GB\'",
        "cpus": "1"
    },
    "chewbbaca": {
        "memory": r"\'2GB\'",
        "cpus": "2",
        "queue": r"\'chewBBACA\'"
    },
    "seq_typing": {
        "memory": r"\'2GB\'",
        "cpus": "2"
    },
    "patho_typing": {
        "memory": r"\'2GB\'",
        "cpus": "2"
    },
    "sistr": {
        "memory": r"\'2GB\'",
        "cpus": "1"
    },
}


SERVER_IP = 'web'
FRONTEND_SERVER_IP = 'web'

#######################SLURM CONF ##############

DEFAULT_SLURM_CPUS = '8'
NEXTFLOW_PROFILE = 'desktop'
NEXTFLOW_GENERATOR_PATH = '/Controller/flowcraft/flowcraft/flowcraft.py'
NEXTFLOW_GENERATOR_RECIPE = 'innuendo'
FASTQPATH = "data/*_{1,2}.*"
INSPECT_ROUTE = "http://web/"

JOBS_ROOT_SET_OUTPUT = 'http://'+SERVER_IP+'/jobs/setoutput/'
JOBS_ROOT_SET_REPORT = 'http://'+FRONTEND_SERVER_IP+'/app/api/v1.0/jobs/report/'

CHEWBBACA_PARTITION = 'chewBBACA'
CHEWBBACA_SCHEMAS_PATH = '/INNUENDO/inputs/schemas'

CHEWBBACA_TRAINING_FILE = {
    "E.coli": "/INNUENDO/inputs/prodigal_training_files/prodigal_training_files/Escherichia_coli.trn",
    "Yersinia": "/INNUENDO/inputs/prodigal_training_files/prodigal_training_files/Yersinia_enterocolitica.trn",
    "Campylobacter": "/INNUENDO/inputs/prodigal_training_files/prodigal_training_files/Campylobacter_jejuni.trn",
    "Salmonella": "/INNUENDO/inputs/prodigal_training_files/prodigal_training_files/Salmonella_enterica.trn"
}

CHEWBBACA_CORRESPONDENCE = {
    "E.coli": "Escherichia coli",
    "Yersinia": "Yersinia enterocolitica",
    "Campylobacter": "Campylobacter jejuni",
    "Salmonella": "Salmonella enterica"
}

MLST_CORRESPONDENCE = {
    "E.coli": "ecoli",
    "Yersinia": "yersinia",
    "Campylobacter": "campylobacter",
    "Salmonella": "senterica"

}

MLST_VERSION = "tuberfree"


SEQ_FILE_O = {
    "v1": {
        "E.coli": "/INNUENDO/inputs/serotyping_files/escherichia_coli/1_O_type.fasta"
    }
}

SEQ_FILE_H = {
    "v1": {
        "E.coli": "/INNUENDO/inputs/serotyping_files/escherichia_coli/2_H_type.fasta"
    }
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
    "v1": {
        "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_wg.index",
        "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_wg",
        "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_wg",
        "Campylobacter": "/INNUENDO/inputs/v1/indexes/campy_wg"
    }
}

core_index_correspondece = {
    "v1": {
        "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_core.index",
        "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_core",
        "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_core",
        "Campylobacter": "/INNUENDO/inputs/v1/indexes/campy_core"
    }
}

wg_headers_correspondece = {
    "v1": {
        "E.coli": "/INNUENDO/inputs/v1/core_lists/ecoli_headers_wg.txt",
        "Yersinia": "/INNUENDO/inputs/v1/core_lists/yersinia_headers_wg.txt",
        "Salmonella": "/INNUENDO/inputs/v1/core_lists/salmonella_headers_wg.txt",
        "Campylobacter": "/INNUENDO/inputs/v1/core_lists/campy_headers_wg.txt"
    }
}
core_headers_correspondece = {
    "v1": {
        "E.coli": "/INNUENDO/inputs/v1/core_lists/ecoli_headers_core.txt",
        "Yersinia": "/INNUENDO/inputs/v1/core_lists/yersinia_headers_core.txt",
        "Salmonella": "/INNUENDO/inputs/v1/core_lists/salmonella_headers_core.txt",
        "Campylobacter": "/INNUENDO/inputs/v1/core_lists/campy_headers_core.txt"
    }
}

core_increment_profile_file_correspondece = {
    "v1": {
        "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_core_profiles.tab",
        "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_core_profiles.tab",
        "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_core_profiles.tab",
        "Campylobacter": "/INNUENDO/inputs/v1/indexes/campy_core_profiles.tab"
    }
}

wg_increment_profile_file_correspondece = {
    "v1": {
        "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_wg_profiles.tab",
        "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_wg_profiles.tab",
        "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_wg_profiles.tab",
        "Campylobacter": "/INNUENDO/inputs/v1/indexes/campy_wg_profiles.tab"
    }
}

species_expected_genome_size = {
    "E.coli": "5",
    "Yersinia": "4.7",
    "Salmonella": "4.6",
    "Campylobacter": "1.6"
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
