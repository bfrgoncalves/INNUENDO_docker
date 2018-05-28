INNUENDO Platform
=================

**INNUENDO platform** is divided into two distinct applications that communicate
between each other. The first one, the **INNUENDO frontend server**,
comprises the user web interface and mechanisms to allow secure user
authentication with LDAP and data storage into a dedicated database. It also
communicates with the **INNUENDO process controller**, which was developed with
the aim of working as a bridge to allow running analytical procedures on a
laptop or in a High Performance Computer (HPC), with the help of SLURM
process manager and Nextflow.

There is also a **docker-compose** version of the platform that can be easily
installed with a few commands.

.. image:: images/INNUENDO_schema.png


Contents
========

The documentation of the **INNUENDO Platform** follows the below structure:

* :ref:`dependencies`

* :ref:`installation`

* :ref:`usage`

* :ref:`troubleshooting`

.. _dependencies:

.. toctree::
   :maxdepth: 1
   :caption: Dependencies

   dependencies/dependencies-list

.. _installation:

.. toctree::
   :maxdepth: 1
   :caption: Installation

   installation/nginx
   installation/allegrograph
   installation/postgres
   installation/ldap
   installation/flowcraft
   installation/nextflow
   installation/slurm
   installation/frontend
   installation/controller
   installation/reports

.. _usage:

.. toctree::
   :maxdepth: 1
   :caption: Usage

   usage/set-protocols
   usage/set-workflows

.. _troubleshooting:

.. toctree::
   :maxdepth: 1
   :caption: Troubleshooting

   troubleshooting/test
