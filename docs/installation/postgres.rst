PostgreSQL
========

PostgreSQL is the default database used in the INNUENDO Platform for data
storage. It needs to be installed in the same machine as the Frontend server
or configured in such a way that the Frontend server can access to it.

Installation
------------

::

    sudo apt-get update
    sudo apt-get install postgresql postgresql-contrib


Create Postgres User
--------------------

Enter with the default "postgres" user and create a new user to be used in
the Platform.
Change the version according to the installed postgres version. Is
recommended to use postgres version < 10.

::

    sudo -u postgres /usr/lib/postgresql/9.X/bin/createuser innuendo

Create the Database
-------------------

Launch psql with the default postgres user.

::

    sudo -u postgres psql postgres

Inside psql, set a password for the default postgres user.

::

    postgres=# \password postgres

Change the permissions of the previously created user to allow the creation
of databases.

::

    postgres=# ALTER USER innuendo CREATEDB;

Create the innuendo database.

::

    postgres=# CREATE DATABASE innuendo OWNER innuendo;

Exit psql.

::

    postgres=# \q


Change Configuration file
-------------------------

Locate the postgreSQL pg_hba.conf file. It has all the information regarding
access security to the database. It is required to change some of the
parameters.

The file should be at */etc/postgresql/9.X/main/*

Open it and replace all the METHOD column to *trust*

Restart postgreSQL.

::

    sudo service postgresql restart


Set password for the INNUENDO user
----------------------------------

Launch psql with the created user.

::

    sudo -u innuendo psql innuendo

Inside psql, set a password for the innuendo user.

::

    postgres=# \password innuendo

Exit psql.

::

    postgres=# \q


Change Configuration file (AGAIN)
---------------------------------

Open the *pg_hba.conf* file and replace all METHOD column to *md5*.

Restart postgreSQL.

::

    sudo service postgresql restart


Create/Load the database structure
----------------------------------

Now you can load the database structure using a set of commands defined by the
Flask-Migrate package. It should be available after installing the Frontend
server and all its dependencies.

Inside de **INNUENDO_REST_API** folder run.

::

    # Initialize the database and build a migrations directory
    ./manage.py db init --multidb

    # Sets the new version of the database
    ./manage.py db migrate

    # Recreates the database with the newest version
    ./manage.py db upgrade
