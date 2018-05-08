import os
basedir = os.path.abspath(os.path.dirname("__file__"))

# CURRENT ROOT
FRONTEND_IP = 'web'
phyloviz_root = 'http://localhost'

AGRAPH_IP='web'

CURRENT_ROOT = 'http://'+FRONTEND_IP+'/app'

FILES_ENTRY_POINT = 'https://'+FRONTEND_IP+'/app'

# LDAP IP
LDAP_IP = 'openldap'

# INNUENDO SLURM MASTER IP
JOBS_IP = 'web'

# JOBS ROOT
JOBS_ROOT = 'http://'+JOBS_IP+'/jobs/'

# OUTPUT PROCESS URL
OUTPUT_URL = CURRENT_ROOT + 'api/v1.0/ngsonto/projects/<int:id>/pipelines/<int:id2>/processes/<int:id3>/outputs/'

# Files ROOT
FILES_ROOT = 'http://'+JOBS_IP+'/jobs/fastqs/'

# DOWNLOAD ROOT
DOWNLOADS_ROOT = 'http://'+JOBS_IP+'/jobs/download/'

REPORTS_URL = "/reportsApp/"

# user storages
USER_STORAGES = ["evira_storage/users", "thl_storage/users"]

# keys for passwords
SECRET_KEY = 'super-secret'
SECURITY_PASSWORD_HASH = 'pbkdf2_sha512'
SECURITY_PASSWORD_SALT = 'salt_1'

# Admin_info
ADMIN_EMAIL = 'innuendo@admin.com'
ADMIN_NAME = 'Admin'
ADMIN_USERNAME = 'innuendo_admin'
ADMIN_PASS = 'password'

ADMIN_GID = '501'

# CONFIG file for INNUENDO Job Controller
REDIS_URL = 'redis://redis:6379'

# Dependencies paths
INNUCA_PATH = 'dependencies/INNUca/INNUca.py'

# Enable security views
SECURITY_REGISTERABLE = False
SECURITY_RECOVERABLE = True
SECURITY_CHANGEABLE = True
SECURITY_FLASH_MESSAGES = True

########## Database endpoints and migrate repositories #######################

DATABASE_USER = 'innuendo'
DATABASE_PASS = 'innuendo_database'

database_uri = 'postgresql://' + \
               DATABASE_USER+':'+DATABASE_PASS + \
               '@db_mlst/mlst_database'

innuendo_database_uri = 'postgresql://' + \
                        DATABASE_USER+':'+DATABASE_PASS + \
                        '@db_innuendo/innuendo'

SQLALCHEMY_BINDS = {
    'mlst_database': database_uri,
    'innuendo_database': innuendo_database_uri
}

# Location to be used to store and update database files
SQLALCHEMY_MIGRATE_REPO = os.path.join(basedir, 'db_repository')
SQLALCHEMY_TRACK_MODIFICATIONS = True

# Mail configuration
MAIL_SERVER = 'smtp.gmail.com'
MAIL_PORT = 465
MAIL_USE_SSL = True
MAIL_USERNAME = 'phylovizonline@gmail.com'
MAIL_PASSWORD = 'phyloviz_online'
WTF_CSRF_ENABLED = False
#To be used in the Flask-WTF extension

#File upload information
UPLOAD_FOLDER = 'app/uploads/'
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif', 'tab'])

#APP ROOT
app_route = '/app'
APPLICATION_ROOT = app_route

SECURITY_POST_LOGIN_VIEW = app_route
SECURITY_POST_LOGOUT_VIEW = app_route
SECURITY_POST_REGISTER_VIEW = app_route
SECURITY_POST_CONFIRM_VIEW = app_route
SECURITY_POST_RESET_VIEW = app_route
SECURITY_POST_CHANGE_VIEW = app_route

################## sftp ################################################

SFTP_HOST = LDAP_IP
SFTP_PORT = '22'

################## ldap ################################################

LDAP_PROVIDER_URL = LDAP_IP
LDAP_PROTOCOL_VERSION = 3
baseDN = 'dc=innuendo,dc=com'
LDAP_ADMIN_NAME = "admin"
LDAP_ADMIN_PASS = "verysecret"

################## DEFAULT USER SETTINGS ################################
LOGIN_METHOD = "None"
LOGIN_GID = "501"
LOGIN_HOMEDIR = "/INNUENDO/"
LOGIN_USERNAME = "innuendo_user"
LOGIN_PASSWORD = "innuendo_user"
LOGIN_EMAIL = "innuendo@innuendo.com"


########DECODIFICATION OF DATABASES AND BASE METADATA FOR MLST DATABASE #######

ALL_SPECIES = [
    "E.coli",
    "Yersinia",
    "Campylobacter",
    "Salmonella"
]


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
    'Source Type': 'source_Source',
    'Country': 'Location',
    'Serotype': 'Serotype',
    'Simple Patho': 'Pathotyping',
    'ST(Achtman 7 Gene)': 'ST'
}

metadata_to_use_yersinia = {
    'FILE': 'strainID',
    'Source': 'source_Source',
    'Country': 'Location',
    'Serotype': 'Serotype',
    'Pathotype': 'Pathotyping',
    'ST': 'ST'
}

base_metadata = {
    "strainID": "",
    "source_Source": "",
    "Location": "",
    "Serotype": "",
    "Pathotyping": "",
    "ST": ""
}

wg_index_correspondece = {
    "E.coli": "./chewbbaca_database_profiles/indexes/ecoli_wg",
    "Yersinia": "./chewbbaca_database_profiles/indexes/yersinia_wg",
    "Salmonella": "./chewbbaca_database_profiles/indexes/salmonella_wg"
}

core_index_correspondece = {
    "E.coli": "./chewbbaca_database_profiles/indexes/ecoli_core",
    "Yersinia": "./chewbbaca_database_profiles/indexes/yersinia_core",
    "Salmonella": "./chewbbaca_database_profiles/indexes/salmonella_core"
}

wg_headers_correspondece = {
    "E.coli": "./chewbbaca_database_profiles/profiles_headers/ecoli_headers_wg.txt",
    "Yersinia": "./chewbbaca_database_profiles/profiles_headers/yersinia_headers_wg.txt",
    "Salmonella": "./chewbbaca_database_profiles/profiles_headers/salmonella_headers_wg.txt"
}
core_headers_correspondece = {
    "E.coli": "./chewbbaca_database_profiles/profiles_headers/ecoli_headers_core.txt",
    "Yersinia": "./chewbbaca_database_profiles/profiles_headers/yersinia_headers_core.txt",
    "Salmonella": "./chewbbaca_database_profiles/profiles_headers/salmonella_headers_core.txt"
}

core_increment_profile_file_correspondece = {
    "E.coli": "./chewbbaca_database_profiles/indexes/ecoli_core_profiles.tab",
    "Yersinia": "./chewbbaca_database_profiles/indexes/yersinia_core_profiles.tab",
    "Salmonella": "./chewbbaca_database_profiles/indexes/salmonella_core_profiles.tab"
}

wg_increment_profile_file_correspondece = {
    "E.coli": "./chewbbaca_database_profiles/indexes/ecoli_wg_profiles.tab",
    "Yersinia": "./chewbbaca_database_profiles/indexes/yersinia_wg_profiles.tab",
    "Salmonella": "./chewbbaca_database_profiles/indexes/salmonella_wg_profiles.tab"
}

classification_levels = {
    "E.coli": [7, 112],
    "Yersinia": [7, 133],
    "Salmonella": [7, 338],
    "Campylobacter": [4, 59]
}

##################  ALLEGROGRAPH CONFIGURATION  ###############################

CURRENT_DIRECTORY = os.getcwd()

AG_HOST = os.environ.get('AGRAPH_HOST', AGRAPH_IP)
AG_PORT = int(os.environ.get('AGRAPH_PORT', '10035'))

AG_REPOSITORY = 'innuendo'
AG_USER = 'innuendo'
AG_PASSWORD = 'innuendo_allegro'

# List namespaces
obo = "http://purl.obolibrary.org/obo/"
dcterms= "http://purl.org/dc/terms/"
edam = "http://edamontology.org#"
localNSpace="http://ngsonto.net/api/v1.0/"


pTypes =[
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
