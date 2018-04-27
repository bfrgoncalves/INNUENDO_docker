FROM ubuntu:16.04
MAINTAINER Bruno Gonçalves <bfgoncalves@medicina.ulisboa.pt>

# Create frontend folder
WORKDIR /Allegrograph/

# Install general dependencies
RUN apt-get update && apt-get install -y git python-pip libpq-dev \
                        libcurl4-openssl-dev python-dev libsasl2-dev \
                        libldap2-dev libssl-dev wget

# Get Allegrograph Server
RUN wget https://github.com/bfrgoncalves/INNUENDO_files/releases/download/1.0.0/agraph-6.0.2-linuxamd64.64.tar.gz

# Uncompress the files
RUN tar zxf agraph-6.0.2-linuxamd64.64.tar.gz

# Move to created directory
RUN agraph-6.0.2/install-agraph /Allegrograph/agraph --non-interactive \
--config-file "/Allegrograph/agraph/lib/agraph.cfg" \
--data-dir "/Allegrograph/agraph/data" \
--log-dir "/Allegrograph/agraph/log" \
--pid-file "/Allegrograph/agraph/data/agraph.pid" \
--runas-user "innuendo" \
--create-runas-user \
--port 10035 \
--super-user "innuendo" \
--super-password "innuendo_allegro"

#CMD ["/Allegrograph/agraph/bin/agraph-control", "--config",
#"/Allegrograph/agraph/lib/agraph.cfg", "start"]
