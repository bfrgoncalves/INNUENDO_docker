Frontend Server
===============

The Frontend server of the INNUENDO Platform is the application responsable
for serving the static files to the user, interact with the potsgreSQL
database, and send requests to the Controller server to submit jobs.

Installation
------------

Good practice to install application specific dependencies is to first create
a virtual environment, which will aggregate all the required dependencies
for a specific application.

Because of that, the first thing to do is to install python virtualenv.

::

    sudo apt-get install python-virtualenv

The code for the Frontend server is located at github and can be obtained
using git.

::

    git clone https://github.com/bfrgoncalves/INNUENDO_REST_API.git

To create the virtual environment, run the application inside the
INNUENDO_REST_API folder.

::

    cd INNUENDO_REST_API

    # Create virtual environment
    virtualenv flask

requirements.txt
----------------

The requirements.txt file is the file with all the required python
dependencies for the application. To install them, run the following command
inside the INNUENDO_REST_API folder.

::

    flask/bin/pip install -r requirements.txt

Due to some lack of some dependencies, you might also need to install the
following python packages described into the following links:

::

    https://stackoverflow.com/questions/11618898/pg-config-executable-not-found
    https://stackoverflow.com/questions/28253681/you-need-to-install-postgresql-server-dev-x-y-for-building-a-server-side-extensi
    https://stackoverflow.com/questions/23937933/could-not-run-curl-config-errno-2-no-such-file-or-directory-when-installing
    https://stackoverflow.com/questions/21530577/fatal-error-python-h-no-such-file-or-directory
    http://thefourtheye.in/2013/04/20/installing-python-ldap-in-ubuntu/


Bower Components
----------------

Bower is a package manager used to fetch all the client-side components required
to create the user interface. It requires nodeJS for the installation so we
need to install nodeJS before installing Bower and the client-side dependencies.

::

    # Get nodeJS and install
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    sudo apt-get install -y nodejs

    # Install Bower
    npm install -g bower

Install Bower components by running ``bower install`` inside the
``INNUENDO_REST_API/app`` folder.

Running the APP
---------------

To run the application, we first need to add the allegrograph client location
to the path. To do it, install the Allegrograph client and run the following
command.

::

    export PYTHONPATH=/full/path/for/agraph-6.2.1-client-python/src/

Then, we need to run the `worker.py`` to allow classification and to send
requests to PHYLOViZ Online and we need to run the ``run.py`` to launch the
INNUENDO_REST_API application.

::

    cd /path/to/INNUENDO_REST_API
    ./worker.py &
    ./run.py

Enjoy!