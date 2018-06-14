Inspecting Platform Logs
========================

Admins of the INNUENDO Platform have some extra features to visualize logs
for each process on every Project. When an admin enters a project he can
visualize the logs by clicking on the *Information* button available for
each strain on a project, in the *Analysis* column.

.. image:: ../images/info_button.png

By clicking on that button the admin gets access to the information described
bellow.

FlowCraft Build Log
^^^^^^^^^^^^^^^^^^^

The INNUENDO Platform builds the pipelines based on the FlowCraft software. It
builds the nextflow files required by using the Nextflow Tags defined when
creating the protocols as inputs.

Information regarding cpu usage, memory, and other directives can also be
passed to FlowCraft when building the pipelines.

::

    python3 /home/ubuntu/innuendo/flowcraft/flowcraft/flowcraft.py build -t reads_download={'pid':1,'cpus':'2','memory':'\'4GB\''} integrity_coverage={'pid':2,'cpus':'1','memory':'\'4GB\''} fastqc_trimmomatic={'pid':3,'cpus':'2','memory':'\'4GB\''} true_coverage={'pid':4,'cpus':'2','memory':'\'4GB\''} fastqc={'pid':5,'cpus':'2','memory':'\'4GB\''} check_coverage={'pid':6,'cpus':'1','memory':'\'4GB\''} spades={'pid':7,'scratch':'true','cpus':'4','memory':'\'4GB\''} process_spades={'pid':8,'cpus':'1','memory':'\'4GB\''} assembly_mapping={'pid':9,'cpus':'2','memory':'\'4GB\''} pilon={'pid':10,'cpus':'2','memory':'\'4GB\''} mlst={'pid':11,'version':'tuberfree','cpus':'1','memory':'\'4GB\''} abricate={'pid':12,'cpus':'2','memory':'\'4GB\''} chewbbaca={'pid':13,'queue':'\'chewBBACA\'','cpus':'8','memory':'\'4GB\''} -o /mnt/innuendo_storage/users/bgoncalves/jobs/8-9/8_9.nf -r innuendo
    [1;32m========= F L O W C R A F T =========
    Build mode
    version: 1.1.0
    build: 20042018
    =====================================[0m
    [1;38mResulting pipeline string:
    [0m
    [1;38m reads_download={'pid':1,'cpus':'2','memory':'\'4GB\''} integrity_coverage={'pid':2,'cpus':'1','memory':'\'4GB\''} fastqc_trimmomatic={'pid':3,'cpus':'2','memory':'\'4GB\''} true_coverage={'pid':4,'cpus':'2','memory':'\'4GB\''} fastqc={'pid':5,'cpus':'2','memory':'\'4GB\''} check_coverage={'pid':6,'cpus':'1','memory':'\'4GB\''} spades={'pid':7,'scratch':'true','cpus':'4','memory':'\'4GB\''} process_spades={'pid':8,'cpus':'1','memory':'\'4GB\''} assembly_mapping={'pid':9,'cpus':'2','memory':'\'4GB\''} pilon={'pid':10,'cpus':'2','memory':'\'4GB\''} mlst={'pid':11,'version':'tuberfree','cpus':'1','memory':'\'4GB\''} ( abricate={'pid':12,'cpus':'2','memory':'\'4GB\''} | chewbbaca={'pid':13,'queue':'\'chewBBACA\'','cpus':'8','memory':'\'4GB\''} )
    [0m
    [1;38mChecking pipeline for errors...[0m
    [1;38mBuilding your awesome pipeline...[0m
    [1;38m	Successfully connected 13 process(es) with 1 fork(s) across 3 lane(s) ✓[0m
    [1;38m	Channels set for init ✓[0m
    [1;38m	Channels set for reads_download ✓[0m
    [1;38m	Channels set for integrity_coverage ✓[0m
    [1;38m	Channels set for fastqc_trimmomatic ✓[0m
    [1;38m	Channels set for true_coverage ✓[0m
    [1;38m	Channels set for fastqc ✓[0m
    [1;38m	Channels set for check_coverage ✓[0m
    [1;38m	Channels set for spades ✓[0m
    [1;38m	Channels set for process_spades ✓[0m
    [1;38m	Channels set for assembly_mapping ✓[0m
    [1;38m	Channels set for pilon ✓[0m
    [1;38m	Channels set for mlst ✓[0m
    [1;38m	Channels set for abricate ✓[0m
    [1;38m	Channels set for chewbbaca ✓[0m
    [1;38m	Successfully set 10 secondary input(s) ✓[0m
    [1;38m	Successfully set 3 secondary channel(s) ✓[0m
    [1;38m	Finished configurations ✓[0m
    [1;38m	Pipeline written into /mnt/innuendo_storage/users/bgoncalves/jobs/8-9/8_9.nf ✓[0m
    [1;32mDONE![0m

Platform Config
^^^^^^^^^^^^^^^

When running a pipeline using FlowCraft, there are some input variables
required depending on the software used. Below is described the inputs
required to run the pipeline built above.

::

    params {
        accessions="/mnt/innuendo_storage/users/bgoncalves/jobs/8-9/accessions.txt"
        platformSpecies="Campylobacter"
        referenceFileO=""
        currentUserName="bgoncalves"
        schemaSelectedLoci="/home/ubuntu/innuendo/schemas/ccoli_cjejuni_Py3/listGenes.txt"
        currentUserId="4"
        projectId="8"
        asperaKey="/mnt/singularity_cache/shared_files/asperaweb_id_dsa.openssh"
        pipelineId="9"
        reportHTTP="http://192.168.1.10/app/api/v1.0/jobs/report/"
        chewbbacaTraining="/home/ubuntu/innuendo/prodigal_training_files/prodigal_training_files/Campylobacter_jejuni.trn"
        schemaPath="/home/ubuntu/innuendo/schemas/ccoli_cjejuni_Py3"
        referenceFileH=""
        genomeSize="1.6"
        platformHTTP="http://192.168.1.11/jobs/setoutput/"
        sampleName="ERR2601756"
        species="Campylobacter jejuni"
        mlstSpecies="campylobacter"
        schemaCore="/home/ubuntu/innuendo/core_lists/core_lists/campy_headers_core.txt"
        chewbbacaJson=true
    }


Nextflow Run Logs
^^^^^^^^^^^^^^^^^

After starting a run with Nextflow, it starting given the log above what
processes are being submitted. Below is described the *nextflow log* that is
provided by nextflow on every pipeline run.

::

    N E X T F L O W  ~  version 0.30.1
    Launching `/mnt/innuendo_storage/users/bgoncalves/jobs/8-9/8_9.nf` [agitated_lamarr] - revision: d8c53f4c58
    WARN: It seems you never run this project before -- Option `-resume` is ignored
    WARN: The config file defines settings for an unknown process: chewbbaca -- Did you mean: chewbbaca_13?

    ============================================================
                    F L O W C R A F T
    ============================================================
    Built using flowcraft v1.1.0

     Input accessions            : 1
     Reports are found in        : ./reports
     Results are found in        : ./results
     Profile                     : incd

    Starting pipeline at Thu Jun 14 09:56:45 UTC 2018

    [warm up] executor > slurm
    [5b/597bde] Submitted process > reads_download_1 (ERR2601756)
    [64/4ace33] Submitted process > report (null)
    [13/550a1e] Submitted process > status (ERR2601756)
    [1e/0cba15] Submitted process > integrity_coverage_2 (ERR2601756)
    [70/e7768f] Submitted process > status (ERR2601756)
    [ee/6719aa] Submitted process > report_coverage_2
    [c1/689d2d] Submitted process > report (null)
    [7f/34afa4] Submitted process > fastqc_3 (ERR2601756)
    [e3/af508e] Submitted process > status (ERR2601756)
    [eb/5e1ca3] Submitted process > report (null)
    [bf/979467] Submitted process > fastqc_report_3 (ERR2601756)
    [35/b57a70] Submitted process > report (null)
    [de/2443d8] Submitted process > status (ERR2601756)
    [11/80a9bc] Submitted process > trim_report_3
    [b5/e9c230] Submitted process > compile_fastqc_status_3
    [65/4b8bfe] Submitted process > trimmomatic_3 (ERR2601756)
    [2e/9f4768] Submitted process > status (ERR2601756)
    [cf/bae302] Submitted process > report (null)
    [64/d1163d] Submitted process > true_coverage_4 (ERR2601756)
    [73/7b60a2] Submitted process > status (ERR2601756)
    [8c/572e1a] Submitted process > report (null)
    [5a/b3b8d7] Submitted process > fastqc2_5 (ERR2601756)
    [d6/1e6203] Submitted process > status (ERR2601756)
    [1c/a1e215] Submitted process > report (null)
    [44/9376fe] Submitted process > fastqc2_report_5 (ERR2601756)
    [ea/a88007] Submitted process > report (null)
    [48/26e31a] Submitted process > status (ERR2601756)
    [78/747a8e] Submitted process > compile_fastqc_status2_5
    [fd/e66412] Submitted process > integrity_coverage2_6 (ERR2601756)
    [cf/110b82] Submitted process > report (null)
    [90/2cbe38] Submitted process > report_coverage_2_6
    [07/1ec1ad] Submitted process > status (ERR2601756)
    [4f/35ef82] Submitted process > spades_7 (ERR2601756)
    [7e/b41ef9] Submitted process > status (ERR2601756)
    [dc/3e9b1c] Submitted process > report (null)
    [ec/0b1648] Submitted process > process_spades_8 (ERR2601756)
    [9a/474fed] Submitted process > status (ERR2601756)
    [20/de7925] Submitted process > report (null)
    [b4/797d97] Submitted process > assembly_mapping_9 (ERR2601756)
    [e9/076467] Submitted process > status (ERR2601756)
    [f7/b2a31c] Submitted process > report (null)
    [41/0c0c46] Submitted process > process_assembly_mapping_9 (ERR2601756)
    [35/79afe6] Submitted process > report (null)
    [ef/d7dc5e] Submitted process > status (ERR2601756)
    [98/d4720a] Submitted process > pilon_10 (ERR2601756)
    [fb/c97d88] Submitted process > report (null)
    [ff/ae8145] Submitted process > status (ERR2601756)
    [e8/b64b34] Submitted process > mlst_11 (ERR2601756)
    [f6/e6cc66] Submitted process > pilon_report_10 (ERR2601756)
    [d0/2a9846] Submitted process > compile_mlst_11
    [69/2c6096] Submitted process > report (null)
    [c9/e8a0ed] Submitted process > status (ERR2601756)
    [85/0f52a0] Submitted process > abricate_12 (ERR2601756 vfdb)
    [d3/daa42d] Submitted process > abricate_12 (ERR2601756 virulencefinder)
    [12/87469f] Submitted process > abricate_12 (ERR2601756 plasmidfinder)
    [e5/86de26] Submitted process > abricate_12 (ERR2601756 card)
    [83/083261] Submitted process > abricate_12 (ERR2601756 resfinder)
    [5f/0d7e95] Submitted process > chewbbaca_13 (ERR2601756)
    [84/0c1512] Submitted process > report (null)
    [26/eefb06] Submitted process > compile_pilon_report_10
    [d6/488e5f] Submitted process > status (ERR2601756)
    [a5/0b88b0] Submitted process > status (ERR2601756)
    [ff/3ce639] Submitted process > report (null)
    [3a/653f1d] Submitted process > status (ERR2601756)
    [67/969e84] Submitted process > report (null)
    [24/431fa8] Submitted process > report (null)
    [76/4b245f] Submitted process > status (ERR2601756)
    [7d/498efd] Submitted process > status (ERR2601756)
    [22/351c99] Submitted process > report (null)
    [59/b86166] Submitted process > report (null)
    [1c/727625] Submitted process > status (ERR2601756)
    [8d/6cc53d] Submitted process > process_abricate_12
    [4f/e8a62d] Submitted process > report (null)
    [72/9709c5] Submitted process > status (ERR2601756)
    [fd/395422] Submitted process > compile_reports
    [a0/cd14c7] Submitted process > compile_status_buffer (1)
    [4f/3abd7f] Submitted process > compile_status
    Completed at: Thu Jun 14 10:32:18 UTC 2018
    Duration    : 35m 32s
    Success     : true
    Exit status : 0

Between `[]` is described on which folder inside the user jobs directory
structure the data is being stored for that particular process. As so, the
results from `reads_download_1` are being stored at
`/<usersStorage>/<user>/<jobs>/<project_id>-<pipeline_id>/work/5b/597bde`.

To visualize the specific log for that process we should go to the folder
described above and check for the files `.command.log` and `.command.err`,
which are the nextflow files generated with the outputs of a process.


