Set Protocols
=============

In the INNUENDO Platform, protocols are the basic unit for running processes.
They are the building blocks to construct Workflows, which can then be
applied to strains in our projects.

**Protocol creation is responsibility of the INNUENDO platform administrators.**

Protocols are composed of a **Type**, the name of the **used Software**,
a **Nextflow Tag**, **Parameters**, and a **Name**. Each protocol name *MUST*
be unique.

Protocol Types
^^^^^^^^^^^^^^

Protocol types are defined by NGSOnto and are a way of classifying the
available protocols. Each type can have different attributes.

* de-novo assembly protocol
* Sequencing quality control protocol
* Allele Call Protocol
* sequencing Protocol
* DNA Extraction protocol
* Pathotyping Protocol
* Sequence cutting protocol
* mapping assembly protocol
* Filtering protocol
* Library Preparation Protocol

used Software
^^^^^^^^^^^^^

When creating a protocol, other field that needs to exist is the **used
Software**. It is required for the Platform to know which software you are
going to use on that protocol in case some extra steps are required after or
before running it. The available tags are:

* reads_download
* seq_typing
* patho_typing
* integrity_coverage
* fastqc (fastqc_trimmomatic)
* true_coverage
* fastqc_2 (fastqc)
* integrity_coverage_2 (check_coverage)
* spades
* process_mapping
* pilon
* mlst
* sistr
* chewBBACA
* abricate

Each of these tags are closely related to the Nextflow Tags chosen. So, to
have a good agreement between Software and Nextflow Tags, pair them together.

Nextflow Tags
^^^^^^^^^^^^^

Nextflow Tags are the specific names that `FlowCraft <https://github.com/assemblerflow/flowcraft>`_ requires to build
Nextflow pipelines based on the available software at the INNUENDO Platform.

Below you have all the available Nextflow Tags retrieved from FLowCraft that
can be used in the INNUENDO Platform:

::

    => reads_download
       input_type: accessions
       output_type: fastq
       dependencies: None
    => seq_typing
       input_type: fastq
       output_type: None
       dependencies: None
    => patho_typing
       input_type: fastq
       output_type: None
       dependencies: None
    => integrity_coverage
       input_type: fastq
       output_type: fastq
       dependencies: None
    => fastqc_trimmomatic
       input_type: fastq
       output_type: fastq
       dependencies: integrity_coverage
    => true_coverage
       input_type: fastq
       output_type: fastq
       dependencies: None
    => fastqc
       input_type: fastq
       output_type: fastq
       dependencies: None
    => check_coverage
       input_type: fastq
       output_type: fastq
       dependencies: None
    => spades
       input_type: fastq
       output_type: fasta
       dependencies: integrity_coverage
    => process_spades
       input_type: fasta
       output_type: fasta
       dependencies: None
    => assembly_mapping
       input_type: fasta
       output_type: fasta
       dependencies: None
    => pilon
       input_type: fasta
       output_type: fasta
       dependencies: assembly_mapping
    => mlst
       input_type: fasta
       output_type: fasta
       dependencies: None
    => abricate
       input_type: fasta
       output_type: None
       dependencies: None
    => chewbbaca
       input_type: fasta
       output_type: None
       dependencies: None
    => sistr
       input_type: fasta
       output_type: None
       dependencies: None

Protocol Name
^^^^^^^^^^^^^

The protocol name is the identifier that will appear when choosing protocols
to apply to a Workflow. Each protocol name **MUST** be unique. Also, try to
make a reference for the nextflow tag used in the protocol name in order to
establish a better organization regarding available protocols.

For more information regarding **FlowCraft**, checkout this link:
https://assemblerflow.readthedocs.io/en/dev/index.html

