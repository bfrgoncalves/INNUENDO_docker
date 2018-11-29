FROM ubuntu:16.04
MAINTAINER Bruno Gonçalves <bfgoncalves@medicina.ulisboa.pt>

# Create frontend folder
WORKDIR /Frontend/

# Install general dependencies
RUN apt-get update && apt-get install -y git python-pip postgresql \
                        postgresql-contrib python-psycopg2 libpq-dev \
                        libcurl4-openssl-dev python-dev libsasl2-dev \
                        libldap2-dev libssl-dev wget curl build-essential


# Get INNUENDO_REST_API repository
RUN git clone https://github.com/bfrgoncalves/INNUENDO_REST_API.git

# Change to repository
WORKDIR /Frontend/
WORKDIR INNUENDO_REST_API

# Checkout to ES6 version
# RUN git checkout ES6-version

# Install and initialize virtual env
RUN pip install virtualenv
RUN virtualenv flask

# Install repository dependencies
RUN flask/bin/pip install -r requirements.txt
RUN flask/bin/pip install redis==2.10.6 rq==0.12.0 future

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
RUN bower install --allow-root && bower install bootstrap-select --allow-root

# Install FAST-MLST dependency
WORKDIR /Frontend/
RUN git clone https://github.com/B-UMMI/fast-mlst.git
RUN cd fast-mlst && make -C src all

# Change to final directory
WORKDIR /Frontend/INNUENDO_REST_API
# Copy allegro database builder to image
COPY init_allegro.py init_allegro.py

# Copy allegro database structure
COPY ngsonto2017_july_innuendo_latest.owl ngsonto2017_july_innuendo_latest.owl

WORKDIR /Frontend/INNUENDO_REST_API/executables
WORKDIR /Frontend/INNUENDO_REST_API

# Move executables to docker image
COPY build_allegro.py build_allegro.py
COPY populate_dbs.sh executables/populate_dbs.sh
COPY build_indexes.sh executables/build_indexes.sh
COPY backup_dbs.sh executables/backup_dbs.sh
RUN chmod +x executables/build_indexes.sh
RUN chmod +x executables/populate_dbs.sh
RUN chmod +x build_allegro.py
RUN chmod +x executables/backup_dbs.sh

ENV PATH="/Frontend/INNUENDO_REST_API/:${PATH}"
ENV PATH="/Frontend/INNUENDO_REST_API/executables:${PATH}"

# Copy entrypoint for frontend
COPY docker-frontend-entrypoint.sh docker-frontend-entrypoint.sh
RUN chmod +x docker-frontend-entrypoint.sh

ENTRYPOINT ["/Frontend/INNUENDO_REST_API/docker-frontend-entrypoint.sh"]

