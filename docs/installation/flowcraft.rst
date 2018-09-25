FlowCraft
=========

Flowcraft is used in the INNUENDO Platform as the pipeline builder, which
generates the pipelines according to the available protocols. Besides that,
the flowcraft web-application is also used for pipeline process inspection
and visualization of reports.

Installation
------------

For the pipeline builder installation, check the Flowcraft
[documentation](https://flowcraft.readthedocs.io/en/latest/?badge=latest)

For the install the Flowcraft webapp installation for pipleine inspection
report visualization, follow the bellow steps:

::

    # Clone Flowcraft webapp repository
    git clone https://github.com/assemblerflow/flowcraft-webapp.git && cd flowcraft-webapp

    # Install requirements (pipenv and >=python3.6 is required)
    cd flowcraft-webapp
    pipenv install --system --deploy --ignore-pipfile

    # Install frontend dependencies
    cd flowcraft-webapp && yarn install --network-timeout 1000000 && exit

    # Construct required databases databases (postgreSQL is required)
    python3 manage.py makemigrations
    python3 manage.py migrate

    # Build frontend required file
    yarn run build

    # Lauch the application
    python3 manage.py runserver 0.0.0.0:6000

To configure the service, checkout how to do it by going `here <nginx.html>`_.
