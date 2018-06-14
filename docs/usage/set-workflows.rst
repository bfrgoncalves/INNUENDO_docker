Set Workflows
=============

In the INNUENDO Platform, Workflows are the merge of one or more
protocols to build a cascade of events to be applied to you strains. Their
goal is to organize a group of software to be applied and you can then apply
multiple workflows to a strain and build a pipeline according to their specific
**Workflow dependencies**.

As for Protocols, Workflows also have a predefined set of attributes that
need to be filled in order to be successfully applied to a strain. A workflow
must have a **Name**, a **Dependency**, a **Type**, and the **Species**
where that workflow will be available.

Workflows are **Species dependent** so you need to define the workflows that
you want to make available for each species.

**Workflow creation is responsibility of the INNUENDO platform administrators.**

Workflow Name
_____________

Each workflow **MUST** have a name and it cannot be the same even across
Species. The use of special characters are discouraged.

Workflow Dependency
___________________

Workflows can have input dependencies that are required to run them.
Dependencies can be **Fastq** files, **Accession** numbers or any one of the
already available workflows. These dependencies will them be used to guide
the user when applying workflows to their strains.

Type
____

Workflows in the INNUENDO Platform are separated into two types:
**Classifier** and **Procedure**.

* **Classifier** - Procedure to classify non-computing required processes. Used for classification of processes prior to data analysis. Not currently implemented in the INNUENDO Platform.
* **Procedure** - A procedure is a workflow that can be applied to a strain and run on the data associated to that strain.

Currently, only Procedures can be applied to strains.

Workflow Recipes
________________

For the INNUENDO Platform, there are a set of Workflow recipes that can be
constructed to run software on the strain data in the correct order. They
depend on the created protocols which in the examples below they have the
same name as their Nextflow Tags.

* Reads Download:
    * Protocols (1):
        * reads_download
* Serotyping:
    * Protocols (1):
        * seq_typing
* Pathotyping:
    * Protocols (1):
        * patho_typing
* INNUca:
    * Protocols (10):
        * integrity_coverage
        * fastqc_trimmomatic
        * true_coverage
        * fastqc
        * check_coverage
        * spades
        * process_spades
        * assembly_mapping
        * pilon
        * mlst
* chewBBACA:
    * Protocols (1):
        * chewbbaca
        * Protocol Parameters:
            * schema: chewbbaca_schema_folder_name
* Abricate:
    * Protocols (1):
        * abricate
* SISTR:
    * Protocols (1):
        * sistr

