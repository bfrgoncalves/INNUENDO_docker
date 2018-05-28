Nextflow
========

Nextflow is a workflow manager that enables scalable and reproducible scientific
workflows using software containers.
An overview of how to install and its requirements can be found on they
documentation.

https://www.nextflow.io/docs/latest/index.html

However, for a simple installation, you can simply run the following commands.

::

    wget -qO- https://get.nextflow.io | bash

This will install nextflow on the current directory and now you will need to
add it to the path. Can simply move the nextflow executable to the
/usr/local/bin

::

    mv nextflow /usr/local/bin

You can now execute nextflow pipelines.