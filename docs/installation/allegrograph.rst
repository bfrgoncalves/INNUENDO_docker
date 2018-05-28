Allegrograph
============

Allegrograph is a triplestore database used in the INNUENDO Platform to store
relationships between everything, from strains in projects to the processes
that are run on those strains in a specific project.

Currently it uses an unpaid version with store to about 1 million triples. If
required, a paid version can be obtained to obtain more storage.

Installation
------------

Install some general dependencies.

::

    sudo apt-get update
    sudo apt-get install -y git python-pip libpq-dev libcurl4-openssl-dev python-dev libsasl2-dev libldap2-dev libssl-dev wget

Get Allegrograph server installer from the INNUENDO releases.

::

    # Create a directory to store the files
    mkdir allegrograph

    # Enter the directory
    cd allegrograph

    # Download the server files
    wget https://github.com/bfrgoncalves/INNUENDO_files/releases/download/1.0.0/agraph-6.0.2-linuxamd64.64.tar.gz

Uncompress the downloaded files.

::

    tar zxf agraph-6.0.2-linuxamd64.64.tar.gz

Install the Allegrograph server in an non-interactive way. You can change the
file locations and username by changing the inputs in the directives.

::

    agraph-6.0.2/install-agraph ./agraph --non-interactive \
        --config-file "./agraph/lib/agraph.cfg" \
        --data-dir "./agraph/data" \
        --log-dir "./agraph/log" \
        --pid-file "./agraph/data/agraph.pid" \
        --runas-user "innuendo" \
        --create-runas-user \
        --port 10035 \
        --super-user "innuendo" \
        --super-password "innuendo_allegro"

Launch the allegrograph server. It needs to be running for the Frontend
server and the Controller to work.

::

    ./agraph/bin/agraph-control --config /Allegrograph/agraph/lib/agraph.cfg start