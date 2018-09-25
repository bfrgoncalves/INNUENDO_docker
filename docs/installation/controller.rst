Controller
==========

Good practice to install application specific dependencies is to first create
a virtual environment, which will aggregate all the required dependencies
for a specific application.

Because of that, the first thing to do is to install python virtualenv.

::

    sudo apt-get install python-virtualenv

The code for the Frontend server is located at github and can be obtained
using git.

::

    git clone https://github.com/bfrgoncalves/INNUENDO_PROCESS_CONTROLLER.git

To create the virtual environment, run the application inside the
INNUENDO_PROCESS_CONTROLLER folder.

::

    cd INNUENDO_PROCESS_CONTROLLER

    # Create virtual environment
    virtualenv flask

requirements.txt
----------------

The requirements.txt file is the file with all the required python
dependencies for the application. To install them, run the following command
inside the INNUENDO_PROCESS_CONTROLLER folder.

::

    flask/bin/pip install -r requirements.txt

Due to some lack of some dependencies, you might also need to install the
following python packages described into the following links:

::

    https://stackoverflow.com/questions/12982486/glib-compile-error-ffi-h-but-libffi-is-installed
    https://stackoverflow.com/questions/22414109/g-error-trying-to-exec-cc1plus-execvp-no-such-file-or-directory

Running the APP
---------------

To run the application, we first need to add the allegrograph client location
to the path. To do it, install the Allegrograph client and run the following
command.

::

    export PYTHONPATH=/full/path/for/agraph-6.2.1-client-python/src/


Then, we need to run the ``run.py`` to launch the INNUENDO_PROCESS_CONTROLLER
application.

::

    ./run.py
