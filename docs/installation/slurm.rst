SLURM
=====

SLURM is a cluster management and job scheduling system that is used in the
INNUENDO Platform to control job submission and resources between machines or
in individual machines.

It requires a Master node, which will control all other nodes, and Slaves,
which will run the jobs controlled by the master.

Installation
------------

SLURM requires a set of software dependencies to work. We will need to
install MariaDB (Only on the Master) for the SLURM Accounting module and also
Munge for the communication between each machine (On each machine).

::

    sudo apt-get install mariadb-server mariadb-devel
    sudo apt-get install munge munge-libs munge-devel


Starting with Munge, first need to create a secret key on the Server for the
communication between machines. First, we install rng-tools to properly create
the key.

::

    sudo apt-get install rng-tools
    rngd -r /dev/urandom

Now, we create the secret key. You only have to do the creation of the secret
key on the server.

::

    /usr/sbin/create-munge-key -r

    # Create key and change permissions and ownership
    dd if=/dev/urandom bs=1 count=1024 > /etc/munge/munge.key
    chown munge: /etc/munge/munge.key
    chmod 400 /etc/munge/munge.key

After the secret key is created, you will need to send this key to all of the
compute nodes.

::

    # Example sending the key to a slave node called compute-1. You might
    need to change the name with the machine domain
    scp /etc/munge/munge.key root@compute-1:/etc/munge

Now, we SSH into every node and correct the permissions as well as start the
Munge service.

::

    # Change key permissions
    chown -R munge: /etc/munge/ /var/log/munge/
    chmod 0700 /etc/munge/ /var/log/munge/

    # Start Munge service on the computing nodes
    systemctl enable munge
    systemctl start munge

To test Munge, you can try to access another node with Munge from your master
node.

::

    # Example access to node compute-1
    munge -n
    munge -n | unmunge
    munge -n | ssh compute-1 unmunge
    remunge

After all other dependencies are installed, you can now install SLURM with
the following command.

::

    sudo apt-get install slurm-llnl


SLURM Configuration
-------------------

For SLURM configuration, we need to create a `slurm.conf` file and distribute
it between all machines. We also need to define the `slurmdbd.conf` for the
SLURM accouting.

Example `slurm.conf`

::

    # slurm.conf
    #
    # See the slurm.conf man page for more information.
    #
    ClusterName=linux
    ControlMachine=slurmctld
    ControlAddr=slurmctld
    #BackupController=
    #BackupAddr=
    #
    SlurmUser=slurm
    #SlurmdUser=root
    SlurmctldPort=6817
    SlurmdPort=6818
    AuthType=auth/munge
    #JobCredentialPrivateKey=
    #JobCredentialPublicCertificate=
    StateSaveLocation=/var/lib/slurmd
    SlurmdSpoolDir=/var/spool/slurmd
    SwitchType=switch/none
    MpiDefault=none
    SlurmctldPidFile=/var/run/slurmd/slurmctld.pid
    SlurmdPidFile=/var/run/slurmd/slurmd.pid
    ProctrackType=proctrack/linuxproc
    #PluginDir=
    CacheGroups=0
    #FirstJobId=
    ReturnToService=0
    #MaxJobCount=
    #PlugStackConfig=
    #PropagatePrioProcess=
    #PropagateResourceLimits=
    #PropagateResourceLimitsExcept=
    #Prolog=
    #Epilog=
    #SrunProlog=
    #SrunEpilog=
    #TaskProlog=
    #TaskEpilog=
    #TaskPlugin=
    #TrackWCKey=no
    #TreeWidth=50
    #TmpFS=
    #UsePAM=
    #
    # TIMERS
    SlurmctldTimeout=300
    SlurmdTimeout=300
    InactiveLimit=0
    MinJobAge=300
    KillWait=30
    Waittime=0
    #
    # SCHEDULING
    SchedulerType=sched/backfill
    #SchedulerAuth=
    #SchedulerPort=
    #SchedulerRootFilter=
    SelectType=select/cons_res
    SelectTypeParameters=CR_CPU_Memory
    FastSchedule=1
    #PriorityType=priority/multifactor
    #PriorityDecayHalfLife=14-0
    #PriorityUsageResetPeriod=14-0
    #PriorityWeightFairshare=100000
    #PriorityWeightAge=1000
    #PriorityWeightPartition=10000
    #PriorityWeightJobSize=1000
    #PriorityMaxAge=1-0
    #
    # LOGGING
    SlurmctldDebug=3
    SlurmctldLogFile=/var/log/slurm/slurmctld.log
    SlurmdDebug=3
    SlurmdLogFile=/var/log/slurm/slurmd.log
    JobCompType=jobcomp/filetxt
    JobCompLoc=/var/log/slurm/jobcomp.log
    #
    # ACCOUNTING
    JobAcctGatherType=jobacct_gather/linux
    JobAcctGatherFrequency=30
    #
    AccountingStorageType=accounting_storage/slurmdbd
    AccountingStorageHost=slurmdbd
    AccountingStoragePort=6819
    AccountingStorageLoc=slurm_acct_db
    #AccountingStoragePass=
    #AccountingStorageUser=
    #
    # COMPUTE NODES
    NodeName=c1 Procs=2 Sockets=2 CoresPerSocket=1 RealMemory=6800 State=UNKNOWN
    NodeName=c2 Procs=2 Sockets=2 CoresPerSocket=1 RealMemory=6800 State=UNKNOWN
    #
    # PARTITIONS
    PartitionName=normal Default=yes Nodes=c1 Shared=YES State=UP
    PartitionName=nextflow Nodes=c2 Shared=YES State=UP
    PartitionName=chewBBACA Nodes=c1 Shared=YES State=UP QOS=chewbbaca

Once the server node has the slurm.conf correctly, we need to send this file to
the other compute nodes.

::

    # Example transfer to the slurm compute-1
    scp slurm.conf root@compute-1:/etc/slurm/slurm.conf



Example `slurmdbd.conf`

::

    #
    # Example slurmdbd.conf file.
    #
    # See the slurmdbd.conf man page for more information.
    #
    # Archive info
    #ArchiveJobs=yes
    #ArchiveDir="/tmp"
    #ArchiveSteps=yes
    #ArchiveScript=
    #JobPurge=12
    #StepPurge=1
    #
    # Authentication info
    AuthType=auth/munge
    #AuthInfo=/var/run/munge/munge.socket.2
    #
    # slurmDBD info
    DbdAddr=slurmdbd
    DbdHost=slurmdbd
    #DbdPort=6819
    SlurmUser=slurm
    #MessageTimeout=300
    DebugLevel=4
    #DefaultQOS=normal,standby
    LogFile=/var/log/slurm/slurmdbd.log
    PidFile=/var/run/slurmdbd/slurmdbd.pid
    #PluginDir=/usr/lib/slurm
    #PrivateData=accounts,users,usage,jobs
    #TrackWCKey=yes
    #
    # Database info
    StorageType=accounting_storage/mysql
    StorageHost=mysql
    StorageUser=slurm
    StoragePass=password
    StorageLoc=slurm_acct_db

Now, we will configure the server Master node. We need to make sure that the
server has all the right configurations and files.

::

    # Check for log files existence and permissions
    mkdir /var/spool/slurmctld
    chown slurm: /var/spool/slurmctld
    chmod 755 /var/spool/slurmctld
    touch /var/log/slurmctld.log
    chown slurm: /var/log/slurmctld.log
    touch /var/log/slurm_jobacct.log /var/log/slurm_jobcomp.log
    chown slurm: /var/log/slurm_jobacct.log /var/log/slurm_jobcomp.log


We also need to configure all the compute nodes. We need to make sure that
all the compute nodes have the right configurations and files.

::

    # Check for log files existence and permissions
    mkdir /var/spool/slurmd
    chown slurm: /var/spool/slurmd
    chmod 755 /var/spool/slurmd
    touch /var/log/slurmd.log
    chown slurm: /var/log/slurmd.log


Use the following command to make sure that slurmd is configured properly on
the compute machines.

::

    sudo /etc/init.d/slurmd


Use the following command to launch the slurmdbd on the server.

::

    sudo /etc/init.d/slurmdbd


Use the following command to launch the slurm controller on the master server.

::

    sudo /etc/init.d/slurmcltd

Testing SLURM
-------------

To display the compute nodes use the following.

::

    scontrol show nodes

