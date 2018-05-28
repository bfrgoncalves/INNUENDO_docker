Nginx
=====

Nginx is a web-server used to allow communication between different machines
and expose the Frontend application to the web if required.

Each Application has a RESTful API used for the communication. The route for
each of these applications needs to be mapped into the nginx configuration
file for each independent machine.

Installation
------------

Install the Nginx software from the package manager.

::

    sudo apt-get install nginx

Create a new configuration file
-------------------------------

Add a new configuration file named innuendo.com which will be used to allow
Nginx to be set as a reverse proxy for the AllegroGraph, INNUENDO_REST_API
application and Reports application.

Fill with the following.

::

    server {
	    listen 80 default_server;
	    listen [::]:80 default_server;

	    listen 443 ssl;
	    server_name _;

	    ssl_certificate /etc/nginx/ssl/nginx.crt;
            ssl_certificate_key /etc/nginx/ssl/nginx.key;

	    location /app {
	        proxy_pass http://localhost:5000;
	    }

	    location / {
	        proxy_pass http://localhost:10035;
	    }

        # Use this location if the INNUENDO_PROCESS_CONTROLLER is on the same
        # machine as the INNUENDO_REST_API. Otherwise, comment this route.
	    location /jobs {
            proxy_pass http://localhost:5001;
        }

	    location /ldap/ {
            rewrite ^/ldap/(.*) /$1  break;
            proxy_pass http://localhost:81;
        }

        location /reportsApp/ {
            rewrite ^/reportsApp/(.*) /$1  break;
            proxy_pass http://localhost:82;
        }

    }

For the INNUENDO Reports application, create a reports.com file and add the
following.

::

    server {
        listen       82;
        server_name  localhost;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;
        root   /usr/src/app;
        index  index.html index.htm;

        location / {
            try_files $uri /index.html;
        }
    }


If the INNUENDO_PROCESS_CONTROLLER is on a different machine, create also a
innuendo.com file and add the following.

::

    server {
	    listen 80 default_server;
	    listen [::]:80 default_server;

	    listen 443 ssl;
	    server_name _;

	    ssl_certificate /etc/nginx/ssl/nginx.crt;
            ssl_certificate_key /etc/nginx/ssl/nginx.key;

	    location /jobs {
            #rewrite ^/jobs/(.*) /$1  break;
            proxy_pass http://localhost:5001;
        }
    }


Create a SSL certificate
------------------------

If a encrypted connection is required, you will need to generate an SSL
certificate. Do that in all the independent machines that require an
encrypted connection, such as the machine with the INNUENDO_REST_API.
Do that with the following commands.

::

    sudo mkdir /etc/nginx/ssl
    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

Add to sites-available
----------------------

For the configuration files be used by Nginx, they need to be located into
the sites-available folder. You can do that with the following commands.

::

    # Move the configuration file to the sites-available folder of Nginx
    mv innuendo.com /etc/nginx/sites-available/

    # Move the reports configuration file to the sites-available folder of Nginx
    mv reports.com /etc/nginx/sites-available/

    # Enter the sites-available folder
    cd /etc/nginx/sites-available/

    # Link the innuendo.com file to one in the sites-enabled folder
    ln -s /etc/nginx/sites-available/innuendo.com /etc/nginx/sites-enabled/

    # Link the reports.com file to one in the sites-enabled folder
    ln -s /etc/nginx/sites-available/innuendo.com /etc/nginx/sites-enabled/

Restart Nginx
-------------

Restart Nginx so that the changes can take place.

::

    sudo service restart nginx
