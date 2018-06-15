Troubleshooting
===============

In this section we are going to add some of the possible scenarios that can
cause the admins to interact with the INNUENDO Platform to solve possible
problems.

1 - Web application not showing in the web browser
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In case the web application does not show in the web browser, do the
following steps.

1. **Check the internet connection**:
    Verify if the user has internet connection since it is required to
    interact with the INNUENDO Platform.
2. **Verify if the frontend service is up**:
    Check if the frontend server is up by entering the machine with the
    frontend application. If the service is not running, start it.
3. **Check if Nginx service is up**:
    Check if the Nginx service is running by typing `service nginx status`.
    If is not running, start it by typing `service nginx start`.
4. **Check the Nginx configuration file**:
    If the above step does not work, check the Nginx configuration file for
    possible errors.

In case the above steps don't solve the problem, please contact the developer.

2 - Job submission stuck on waiting animation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In case the loading screen does not disappear after submitting jobs to the
server, do the following steps:

1. **Verify if all services are up**:
    Normally this event can be caused by miss-communication between the
    frontend application and the process controller. Enter the machine
    running the process controller and check if the service is running. If
    not, start it.
2. **Check if jobs were submitted**:
    Enter the user project and go to the *Information* section. Check for the
    Nextflow Logs and Flowcraft Build Logs. You can also check the submitted
    jobs by entering the machine running the **process controller** and type
    `squeue` to check the jobs running.
3. **Re-run if no jobs were submitted**:
    Remove all the workflows applied to the strains with problems, apply
    again and re-run the jobs.

In case the above steps don't solve the problem, please contact the developer.

3- Nextflow aborts a pipeline
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Enter the project with with the problematic strains and check the Nextflow
Logs. In case the pipeline being aborted, resubmit it by clicking on the
Retry button which appears below the log. After the submission, refresh the
log tab to verify if it is running.

In case the above steps don't solve the problem, contact the developer.


4- Profile classification not showing after chewBBACA run
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This can happen because the worker service used for classification and
PHYLOViZ Online submission not being running. Enter the machine with the
frontend server installed and check if the `worker.py` process is running. If
not, start the process.


5- PHYLOViZ Online submission not working
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This can happen because the worker service used for classification and
PHYLOViZ Online submission not being running. Enter the machine with the
frontend server installed and check if the `worker.py` process is running. If
not, start the process.

6- PHYLOViZ Online application not showing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Check if the PHYLOViZ Online services are running. To do that, go to the
machine were PHYLOViZ Online is installed, go to its source code folder and
type `pm2 list`. If all services (app.js and queue_worker.js) are not
running, launch them by typing:

::

    # For the app.js
    pm2 start app.js

    # For the queue_worker.js
    pm2 start queue_worker.js

You can always change the memory and cpus allocated to the processes by running:

::

    # Restart app.js with 2 cpu allocated and 8GB of memory
    pm2 restart app.js -i 2 --node-args="--max-old-space-size=8192"

    # Restart queue_worker.js with 2 cpu allocated and 8GB of memory
    pm2 restart queue_worker.js -i 2 --node-args="--max-old-space-size=8192"


