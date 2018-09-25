Docker-Compose
==============

`Docker-compose <https://docs.docker.com/compose/>`_ and the use of
`Docker <https://docs.docker.com/>`_ allows running all the required INNUENDO
Platform components in a controller environment (containers) in a very
simple way.

Since it uses the docker-images as built using the developed Dockerfiles
that act as a recipe for the installation of all components, it releases
that burden from the user.

Installation
------------

For the docker-compose version of the INNUENDO Platform you will need to
install the following software.

* Docker
* Docker-Compose

On Ubuntu
^^^^^^^^^

First, add the GPG key for the official Docker repository to the system.

::

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


Add the Docker repository to APT sources.

::

    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"


Next, update the package database with the Docker packages from the newly
added repo.

::

    sudo apt-get update


Install Docker.

::

    sudo apt-get install -y docker-ce


Docker should now be installed, the daemon started, and the process enabled
to start on boot. Check that it's running.

::

    sudo systemctl status docker


Next we will install docker-compose. We will check the current release and if
necessary, update it in the command below.

::

    sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose


Next we will set the permissions.

::

    sudo chmod +x /usr/local/bin/docker-compose


Then we can verify that the installation was successful by checking the version.

::

    docker-compose --version

On Windows and Mac
^^^^^^^^^^^^^^^^^^

Install the executables from the docker-compose page.

https://docs.docker.com/compose/install/


Configuration
--------------

Each component of the INNUENDO Platform can be configured by modifying its
configuration file. Configuration files are located at ``configs/`` and are
files required for the Platform to work.

**NOTE:** Modifying these files might lead to corruption of the application.
Proceed with care.

Each file belonging to each component is described bellow.


Frontend Server
^^^^^^^^^^^^^^^

The Frontend server has one configuration file located at
``configs/app/config_frontend.py`` that has a set of variables required for this
module to work in cooperation with the process controller.

**Below defaults are for the docker-compose version.**

``FRONTEND_IP``
    IP address of the machine, default: web
``phyloviz_root``
    Root address of PHYLOViZ Online. default: \http://web:82
``AGRAPH_IP``
    AllegroGraph server IP adress. default: web
``CURRENT_ROOT``
    Current address of the frontend application.
    default: \http://'+FRONTEND_IP+'/app
``JOBS_IP``
    INNUENDO Process Controller IP address. default: web
``JOBS_ROOT``
    Job submission route. default: \http://'+JOBS_IP+'/jobs/'
``FILES_ROOT``
    Route to get information about fastq files. default:\http://'+JOBS_IP+'/jobs/fastqs/'
``REPORTS_URL``
    Reports application route. default: "\http://localhost/reports"
``SECRET_KEY``
    Secret key for flask-security hash.
``SECURITY_PASSWORD_HASH``
    Flask-security type of hash used.
``SECURITY_PASSWORD_SALT``
    Flaks-security salt used.
``ADMIN_EMAIL``
    Email of the platform administrator. default: \innuendo@admin.com
``ADMIN_NAME``
    Administrator name. default: Admin
``ADMIN_USERNAME``
    ADministrator username. default: innuendo_admin
``ADMIN_PASS``
    Administrator password.
``ADMIN_GID``
    Group identifier for admins. default: 501
``REDIS_URL``
    Redis queue URL. default: redis://redis:6379
``SECURITY_REGISTERABLE``
    Allow Flask-security view to register. default: False
``SECURITY_RECOVERABLE``
    Allow Flask-security view to recover password. default: True
``SECURITY_CHANGEABLE``
    Allow Flask-security view to change password. default: True
``SECURITY_FLASH_MESSAGES``
    SHow Flask-security messages. default: True
``FAST_MLST_PATH``
    Path for fast-mlst application used for profile
    classification and search. default: /Frontend/fast-mlst
``NEXTFLOW_TAGS``
    Currently available FlowCraft tags. More information on FlowCraft
    documentation.
``DATABASE_USER``
    User owner of the postgreSQL database. default: innuendo
``DATABASE_PASS``
    Password of the postgreSQL user. default: innuendo_database
``database_uri``
    URI for the wgMLST profile database. default: 'postgresql://'+DATABASE_USER+':'+DATABASE_PASS + '@db_mlst/mlst_database'
``innuendo_database_uri``
    URI for the innuendo database. default: 'postgresql://'+DATABASE_USER+':'+DATABASE_PASS+'@db_innuendo/innuendo'
``SQLALCHEMY_BINDS``
    Databases that bind to SQLAlchemy.
``SQLALCHEMY_MIGRATE_REPO``
    Location to store and update database files. default: os.path.join(basedir, 'db_repository')
``SQLALCHEMY_TRACK_MODIFICATIONS``
    Track database modification. default: True
``WTF_CSRF_ENABLED``
    Enable CSRF. default: False
``app_route``
    Application entry route. default: '/app'
``LDAP_PROVIDER_URL``
    LDAP client IP definition. default: LDAP_IP
``LDAP_PROTOCOL_VERSION``
    LDAP protocol version. default: 3
``baseDN``
    Base repository reference. default: dc=innuendo,dc=com
``LOGIN_METHOD``
    Platform login method. Used to distinguish between LDAP authentication
    and single user authentication used in the docker version. default: None
``LOGIN_GID``
    Login group identifier. Used in case of docker version. default: 501
``LOGIN_HOMEDIR``
    Single user home directory. Used in case of docker version.
    default: /INNUENDO/
``LOGIN_USERNAME``
    Single user username. Used in case of docker version.
    default: innuendo_user
``LOGIN_PASSWORD``
    Single user password. Used in case of docker version. default:
    innuendo_user
``LOGIN_EMAIL``
    Single user email. Used in case of docker version.
    default: \innuendo@innuendo.com
``ALL_SPECIES``
    All supported species. default: ["E.coli","Yersinia","Campylobacter","Salmonella"]
``allele_classes_to_ignore``
    chewBBACA report on profile to replace with 0.
``wg_index_correspondece``
    Path to the wg index file used by fast-mlst for profile search up to x
    differences. Example: {"E.coli": "/INNUENDO/inputs/indexes/ecoli_wg"}
``core_index_correspondece``
    Path to the core index file used by fast-mlst for profile search up to x
    differences. Example: {"E.coli": "/INNUENDO/inputs/indexes/ecoli_core"}
``wg_headers_correspondece``
    Path to the list of the wg loci for each species. Example: {"E.coli": "/INNUENDO/inputs/core_lists/ecoli_headers_wg.txt"}
``core_headers_correspondece``
    Path to the list of the core loci for each species. Example: {"E.coli": "/INNUENDO/inputs/core_lists/ecoli_headers_core.txt"}
``core_increment_profile_file_correspondece``
    Location of the file with the core profiles for each species. Used to
    contruct the search index. Example: {"E.coli": "/INNUENDO/inputs/indexes/ecoli_core_profiles.tab"}
``wg_increment_profile_file_correspondece``
    Location of the file with wg profiles for each species. Used to contruct
    the search index. Example: {"E.coli": "/INNUENDO/inputs/indexes/ecoli_wg_profiles.tab"}
``classification_levels``
    Classification levels for each specie. Number of profile differences.
    Example: {"E.coli": [8, 112, 793]}
``AG_REPOSITORY``
    Name of the AllegroGraph repository. default: innuendo
``AG_USER``
    AllegroGraph user. default: innuendo
``AG_PASSWORD``
    AllegroGraph password. default: innuendo_allegro


Controller Server
^^^^^^^^^^^^^^^^^

The Controller server has one configuration file located at
``configs/app/config_process.py`` that has a set of variables required for this
module to work in cooperation with the frontend and the workflow managers.

**Below defaults are for the docker-compose version.**

``REDIS_URL``
    Redis queue URL. default: redis://redis:6379
``ASPERAKEY``
    Aspera key location. default: ~/.aspera/connect/etc/asperaweb_id_dsa.openssh
``FTP_FILES_FOLDER``
    Location of the files folder in relation to the user home
    directory. default: ftp/files
``NEXTFLOW_RESOURCES``
    Specifications of each nextflow process. Can be used to specify each
    parameter of any given process. Example: { "integrity_coverage":{"memory": r"\'2GB\'","cpus": "1"}
``SERVER_IP``
    IP address of the machine. default: web
``FRONTEND_SERVER_IP``
    IP address of the frontend server. default: web
``DEFAULT_SLURM_CPUS``
    Default SLURM CPUs used when a process is not specified. default: 8
``NEXTFLOW_PROFILE``
    Nextflow profile to use. Those are specified in the FlowCraft software.
    default: desktop
``NEXTFLOW_GENERATOR_PATH``
    Location of the FlowCraft software executable. default:
    /Controller/flowcraft/flowcraft/flowcraft.py
``NEXTFLOW_GENERATOR_RECIPE``
    FlowCraft recipe to use. It defines the set of processes that can be used
    and their relationships. default: innuendo
``FASTQPATH``
    Location of the fastq files in the user directory structure. Used by
    FlowCraft to search for paired end reads. default: "data/*_{1,2}.*"
``JOBS_ROOT_SET_OUTPUT``
    Route used to set the output status of processes. Example: \http://+SERVER_IP+/jobs/setoutput/
``JOBS_ROOT_SET_REPORT``
    Route used to set the reports and store them on the database. Example: \http://+FRONTEND_SERVER_IP+/app/api/v1.0/jobs/report/
``CHEWBBACA_PARTITION``
    Partition name used by SLURM to launch chewBBACA processes. Can only run
    one chewBBACA at a time. default: chewBBACA
``CHEWBBACA_SCHEMAS_PATH``
    Location of the chewBBACA schemas. default: /INNUENDO/inputs/schemas
``CHEWBBACA_TRAINING_FILE``
    Location of prodigal training files for each specie. Example: {
    "E.coli": "/INNUENDO/inputs/prodigal_training_files/prodigal_training_files/Escherichia_coli.trn",
    }
``SEQ_FILE_O``
    SeqTyping FILE_O location. default: {"E.coli": "/INNUENDO/inputs/serotyping_files/escherichia_coli/1_O_type.fasta"}
``SEQ_FILE_H``
    Seqtyping FILE_H location. default: {"E.coli": "/INNUENDO/inputs/serotyping_files/escherichia_coli/2_H_type.fasta"}
``wg_index_correspondece``
    Path to the wg index file used by fast-mlst for profile search up to x
    differences. Example: {"E.coli": "/INNUENDO/inputs/indexes/ecoli_wg"}
``core_index_correspondece``
    Path to the core index file used by fast-mlst for profile search up to x
    differences. Example: {"E.coli": "/INNUENDO/inputs/indexes/ecoli_core"}
``wg_headers_correspondece``
    Path to the list of the wg loci for each species. Example: {"E.coli": "/INNUENDO/inputs/core_lists/ecoli_headers_wg.txt"}
``core_headers_correspondece``
    Path to the list of the core loci for each species. Example: {"E.coli": "/INNUENDO/inputs/core_lists/ecoli_headers_core.txt"}
``core_increment_profile_file_correspondece``
    Location of the file with the core profiles for each species. Used to
    contruct the search index. Example: {"E.coli": "/INNUENDO/inputs/indexes/ecoli_core_profiles.tab"}
``wg_increment_profile_file_correspondece``
    Location of the file with wg profiles for each species. Used to contruct
    the search index. Example: {"E.coli": "/INNUENDO/inputs/indexes/ecoli_wg_profiles.tab"}
``AG_REPOSITORY``
    AllegroGraph repository name. default: innuendo
``AG_USER``
    AllegroGraph username. default: innuendo
``AG_PASSWORD``
    AllegroGraph user password. default: innuendo_allegro


Flowcraft Configuration
^^^^^^^^^^^^^^^^^^^^^^^

The Flowcraft webapp application has two configuration files located at
``configs/flowcraft`` that has a set of variables required for this
module to work in cooperation with the frontend.

**Below are the defaults for the docker-compose version.**

``reportsRoute``
    Route location to fetch for reports. default: \http://localhost/reports


Running the INNUENDO Platform
-----------------------------

Retrieving the docker-compose version
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To launch the docker-compose version of the INNUENDO Platform, first we will
need to get the INNUENDO_docker repository from github which has all the
required Dockerfiles and folder structure to communicate between the
containers and the user file system.

::

    git clone https://github.com/bfrgoncalves/INNUENDO_docker.git

Launching the application
^^^^^^^^^^^^^^^^^^^^^^^^^

After retrieving the repository from github, the first step is to build a
special docker-image that will be used on three diferent INNUENDO
Platform containers (slurmcltd, c1 and c2). To do that, run the following
commands.

::

    # Access the INNUENDO docker repository
    cd /path/to/INNUENDO_docker

    #Build controller image
    docker build -t innuendodocker_controller ./components/Controller


After the anove step, the INNUENDO Platform docker version can be run in a
single command.

::

    # Access the INNUENDO docker repository
    cd /path/to/INNUENDO_docker

    # Launch the application
    docker-compose up

The last command will build all the required images first and then it will
launch all the containers that will communicate between each other by a
docker network that is built by default with docker-compose.

Downloading legacy data and building profile databases
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The application provides a script to download all the required files to
perform comparisons with some already publicly available strains. This is
made through the download of the following data available `here <https://zenodo.org/communities/innuendo>`_:

    * chewBBACA schemas
    * Legacy strain metadata (for each species)
    * Legacy strain profiles (for each species)
    * Serotyping files
    * Prodigal training files

These data will be available under ``./inputs`` and will be mapped to the
docker containers running the application.

The script also build the required files for a rapid comparison between
profiles using `fast-mlst <https://github.com/B-UMMI/fast-mlst>`_ and
populates the ``mlst_database``.

To run the script, type the following command:

::

    # Enter repository directory
    cd <innuendo_docker_directory>

    # Run script to get legacy input files
    ./get_inputs.sh


These steps might take up to 1h depending on the available internet
connection and the host machine.

Mapping data into the Docker containers
---------------------------------------

To map data between the user filesystem and the containers, docker-compose
already has a directive to deal with that action.

Inside the `docker-compose.yml` you got all the required attributes to launch
the container and the interaction between other containers.

Below is described the directives used to launch a service in docker-compose.

::

    # Service for the INNUENDO frontend. Requires the config files for the
    # application and mapping of the fastq files
    frontend:
        # this service uses the dockerfile inside the Frontend directory
        build: ./components/Frontend/
        # Allow run services inside as root
        privileged: true
        # Allow restart on failure
        restart: on-failure
        # Directive to map files and folders to the container. In this case,
        all files before : are files in the user file system. The files after
         : are the location of those files in the container.
        volumes:
          - ./configs/app/config_frontend.py:/Frontend/INNUENDO_REST_API/config.py
          - user_data:/INNUENDO
          - ./inputs/fastq:/INNUENDO/ftp/files
          - ./inputs/v1/classifications:/INNUENDO/inputs/v1/classifications
          - ./inputs/v1/core_lists:/INNUENDO/inputs/v1/core_lists
          - ./inputs/v1/indexes:/INNUENDO/inputs/v1/indexes
          - ./inputs/v1/legacy_metadata:/INNUENDO/inputs/v1/legacy_metadata
          - ./inputs/v1/legacy_profiles:/INNUENDO/inputs/v1/legacy_profiles
          - singularity_cache:/mnt/singularity_cache
        # Ports mapping between container and host
        ports:
          - "5000:5000"
        # Depends on other docker-compose services to work
        depends_on:
          - "allegro"
          - "db_innuendo"
          - "db_mlst"
          - "web"
        # Arguments to give to the docker-entrypoint.sh
        command: ["init_allegro", "build_db", "init_app"]

As seen above, the files can be mapped with the volumes directive.

**Fastq files from the user must be placed into the** ``inputs/fastq``
**folder to be linked with the INNUENDO Platform docker version.**


Backing up/ Build data
----------------------

We provide a series of scripts to backup/build all the required databases
used in the docker-compose version of the INNUENDO Platform. These files are
located at inside the images and need to be triggered after the application
is running. This is made using the ``docker exec`` command on an already
running container.

Backing up/ Build postgreSQL databases
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

There are four postgreSQL databases used in the INNUENDO Platform that can
be backed up: ``innuendo``, ``mlst_database``, ``assemblerflow``, and
``phyloviz``.

All databases backups can be made using a single command for each database.

::

    # Execute script on frontend container to backup database
    # Information on database, username and pass are located in the
    # docker-compose.yml file
    docker exec innuendo_docker_frontend_1 backup_dbs.sh backup <database> <username> <pass> <backup_file_name>

The build command to restore a database to a given backup state is very
similar to the above.

::

    # Execute script on frontend container to build database
    docker exec innuendo_docker_frontend_1 backup_dbs.sh build <database> <username> <pass> <backup_file_name>


Backing up/ Build AllegroGraph databases
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Other database type used in the INNUENDO Platform is a triplestore and it is
also required for the application to retrive to a given state if required.

To backup AllegroGraph, it is only required to run a single command

::

    # Execute script on frontend container to backup allegrograph
    # Information on database, username and pass are located in the
    # docker-compose.yml file
    docker exec innuendo_docker_frontend_1 build_allegro.py backup <backup_file_name>

The build command is similar to the above and is required to move the
application to a given state.


::

    # Execute script on frontend container to backup allegrograph
    docker exec innuendo_docker_frontend_1 build_allegro.py build <backup_file_name>


Customizing Entrypoints
-----------------------

Entrypoints are the files run on container creation with a series of
predefined commands.

On each ``component/`` folder of the application you have an ``entrypoint.sh``
file
and a Dockerfile.

By modifying the commands inside the ``entrypoint.sh`` you can change the
default behaviour when the container for that component launches.


Useful docker commands
----------------------

Bellow are some docker commands that might be useful to interact with the
containers.

Show active containers.

::

    docker-compose ps

Enter container.

::

    docker exec -it container_name bash

List virtual volumes.

::

    docker volume ls

List images.

::

    docker images

Remove images

::

    docker rmi image_name