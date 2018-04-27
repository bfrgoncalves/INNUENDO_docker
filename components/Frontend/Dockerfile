FROM ubuntu:16.04
MAINTAINER Bruno Gonçalves <bfgoncalves@medicina.ulisboa.pt>

# Create frontend folder
WORKDIR /Frontend/

# Install general dependencies
RUN apt-get update && apt-get install -y git python-pip postgresql \
                        postgresql-contrib python-psycopg2 libpq-dev \
                        libcurl4-openssl-dev python-dev libsasl2-dev \
                        libldap2-dev libssl-dev wget curl

# Get INNUENDO_REST_API repository
RUN git clone https://github.com/bfrgoncalves/INNUENDO_REST_API.git

# Change to repository
WORKDIR /Frontend/
WORKDIR INNUENDO_REST_API

# Checkout to ES6 version
RUN git checkout ES6-version

# Install and initialize virtual env
RUN pip install virtualenv
RUN virtualenv flask

# Install repository dependencies
RUN flask/bin/pip install -r requirements.txt
RUN flask/bin/pip install rq future

# Get allegro client
RUN wget https://github.com/bfrgoncalves/INNUENDO_files/releases/download/1.0.0/agraph-6.2.1-client-python.tar.gz

# Uncompress allegro client files
RUN tar zxf agraph-6.2.1-client-python.tar.gz

# Add allegro client to PYTHONPATH
ENV PYTHONPATH="/Frontend/INNUENDO_REST_API/agraph-6.2.1-client-python/src"

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# Install bower
RUN npm install -g bower
WORKDIR app/

# Install bower dependencies
RUN bower install --allow-root

# Install reports dependencies
WORKDIR /Frontend/
RUN git clone https://github.com/ODiogoSilva/report-nf.git
WORKDIR report-nf
RUN git checkout sim-test
RUN bower install --allow-root

# Change to final directory
WORKDIR /Frontend/INNUENDO_REST_API

CMD ["/Frontend/INNUENDO_REST_API/manage.py", "db", "init", "--multidb"]
CMD ["/Frontend/INNUENDO_REST_API/manage.py", "db", "migrate"]
CMD ["/Frontend/INNUENDO_REST_API/manage.py", "db", "upgrade"]
