Reports
=======

The Reports Application is one of the modules from the INNUENDO Platform that
retrieves information from the databases and allows the visualization of
results.

Installation
------------

The code for the reports app can be retrieved at github. To download it, run
the following code.

::

    git clone https://github.com/ODiogoSilva/report-nf.git


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
``report-nf`` folder.


Serving the Reports Application
-------------------------------

The reports-nf application is a set of static files than can be served easily
with Nginx. You can check on how to do it by going `here <nginx.html>`_.