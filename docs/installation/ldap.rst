LDAP
====

LDAP is a centralized authentication system that allow users to authenticate
in multiple applications only using a single account. It requires the
installation of a server application in the service provider machine and
clients in all the machines that want to authenticate.

Before installing LDAP, define an LDAP domain that will be used for the
server creation and for client authentication.

Install LDAP Server
-------------------

To install the LDAP server, run the following command.

::

    sudo apt-get install slapd ldap-utils

    # Choose these options on the installer
    Omit openLDAP config: No
    base DN of the LDAP directory: innuendo.com
    organization name: innuendo
    Database backend to use: HDB
    Database removed when slapd is purged: No
    MOve old database: Yes
    Allow LDAPv2 protocol: No

For an easier integration with LDAP and monitoring, it is advised to install
phpldapadmin, an application that provides a web-interface to deal with LDAP
without using the command line. To install, run the following.

::

    sudo apt-get install phpldapadmin

You can follow the instructions on this tutorial for an easier configuration.
https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-openldap-and-phpldapadmin-on-an-ubuntu-14-04-server

In phpldapadmin, do the following steps:

* Create two Organizational Units.
    * groups
    * users
* Add two Posix Groups to the groups entry created.
    * admin
    * innuendo_users
* Add Generic User Accounts.
    * Add email to the account
    * Add it to the admin or innuendo_users


Install LDAP Client
-------------------

To install the LDAP client needed to authenticate to the server, follow the
tutorial in the link bellow.

https://www.digitalocean.com/community/tutorials/how-to-authenticate-client-computers-using-ldap-on-an-ubuntu-12-04-vps

Change new User Skel structure
------------------------------

Is necessary to change the skel of user creation so that some folders are
created upon user definition. They are required to store the fastq files and
files belonging to job submission.

Go to the skel folder and do the following.

::

    # Enter skel folder
    cd /etc/skel
    # Create ftp and jobs folder
    sudo mkdir ftp jobs
    # Add files folder
    sudo mkdir ftp/files

After completing these steps, two files are required to change the
permissions when creating the folders for the users.

Create a file named change_ldap_user_permissions_innuendo.sh and add the
following.

::

    #!/bin/sh
    chown root:root /mnt/innuendo_storage/users/$PAM_USER
    chown root:root /mnt/innuendo_storage/users/$PAM_USER/ftp

    chown ubuntu:ubuntu /mnt/innuendo_storage/users/$PAM_USER/jobs

This supposes an innuendo_storage folder inside the /mnt folder and a user
running the application called ubuntu. To know more about how to mount
folders between machines check the Configure NFS section.

After creating the permissions file, add it to the pam common-session file at
/etc/pam.d/common-session to trigger the file permissions substitution.


::

    # /etc/pam.d/common-session - session-related modules common to all services
    #
    # This file is included from other service-specific PAM config files,
    # and should contain a list of modules that define tasks to be performed
    # at the start and end of sessions of *any* kind (both interactive and
    # non-interactive).
    #
    # As of pam 1.0.1-6, this file is managed by pam-auth-update by default.
    # To take advantage of this, it is recommended that you configure any
    # local modules either before or after the default block, and use
    # pam-auth-update to manage selection of other modules.  See
    # pam-auth-update(8) for details.

    # here are the per-package modules (the "Primary" block)
    session [default=1]                     pam_permit.so
    # here's the fallback if no module succeeds
    session requisite                       pam_deny.so
    # prime the stack with a positive return value if there isn't one already;
    # this avoids us returning an error just because nothing sets a success code
    # since the modules above will each just jump around
    session required                        pam_permit.so
    # The pam_umask module will set the umask according to the system default in
    # /etc/login.defs and user settings, solving the problem of different
    # umask settings with different shells, display managers, remote sessions etc.
    # See "man pam_umask".
    session optional                        pam_umask.so
    # and here are more per-package modules (the "Additional" block)
    session required        pam_unix.so
    session optional                        pam_ldap.so
    session optional        pam_systemd.so
    # end of pam-auth-update config

    session required        pam_mkhomedir.so skel=/etc/skel umask=0022
    session optional        pam_exec.so /usr/local/bin/change_ldap_user_permissions_innuendo.sh


After replacing the required lines in the files, run the following command to
restart the ldap client service.

::

    sudo /etc/init.d/nscd restart


Setup SFTP (SSH) with LDAP
--------------------------

For Secure File Transfer, we will use the properties of SSH to allow the file
tranfer. For that, we need to change the properties of the SSH configuration
file.

Open the file with the following.

::

    sudo nano /etc/ssh/sshd_config

At the end of the file, replace the Subsystem line and add the two Match Group
entries described bellow. This will only allow SFTP connection of the innuendo
users and will only allow to access to their home directory.

::

    #Subsystem sftp /usr/lib/openssh/sftp-server
    Subsystem sftp internal-sftp

    # Set this to 'yes' to enable PAM authentication, account processing,
    # and session processing. If this is enabled, PAM authentication will
    # be allowed through the ChallengeResponseAuthentication and
    # PasswordAuthentication.  Depending on your PAM configuration,
    # PAM authentication via ChallengeResponseAuthentication may bypass
    # the setting of "PermitRootLogin without-password".
    # If you just want the PAM account and session checks to run without
    # PAM authentication, then enable this but set PasswordAuthentication
    # and ChallengeResponseAuthentication to 'no'.
    UsePAM yes

    Match Group innuendo-users
        ChrootDirectory %h/ftp
        AllowTCPForwarding no
        X11Forwarding no
        ForceCommand internal-sftp

    Match Group admin
        ChrootDirectory %h/ftp
        AllowTCPForwarding no
        X11Forwarding no
        ForceCommand internal-sftp

After replacing the required lines in the file, restart SSH.

::

    sudo /etc/init.d/ssh restart