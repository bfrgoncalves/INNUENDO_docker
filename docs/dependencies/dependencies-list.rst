Dependencies List
=================

The INNUENDO Platform is composed of a set of modules that communicate
between each other by RESTful APIs. However, there are also other
dependencies that are required so that the servers can run as expected.

All those components described bellow are necessary for a multi-machine and
individual component installation. You can also install all the application
using this approach or by using the `Docker-Compose module <.
./docker-compose/docker-compose
.html>`_ developed for this
purpose.

Main modules and their dependencies
-----------------------------------

*Described on parent page

* `Frontend Server <../installation/frontend.html>`_
    * `Nginx <../installation/nginx.html>`_
    * NodeJS*
    * Bower*
    * Allegrograph client*

* `Process Controller Server <../installation/controller.html>`_
    * `Nginx <../installation/nginx.html>`_
    * `Nextflow <../installation/nextflow.html>`_
    * `FlowCraft <../installation/flowcraft.html>`_
    * `Allegrograph client <../installation/allegrograph.html>`_
* `Reports Application <../installation/reports.html>`_
    * `Nginx <../installation/nginx.html>`_
    * NodeJS*
    * Bower*
* `SLURM <../installation/slurm.html>`_
    * MariaDB*
    * Munge*
* `LDAP <../installation/ldap.html>`_
    * LDAP server*
    * phpldapadmin*
    * LDAP client (third party authentication)*
