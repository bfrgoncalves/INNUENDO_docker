FROM ubuntu:16.04
MAINTAINER Bruno Gonçalves <bfgoncalves@medicina.ulisboa.pt>

# Create frontend folder
WORKDIR /PHYLOVIZ/

# Install general dependencies
RUN apt-get update && apt-get install -y git postgresql nodejs-legacy npm \
                        build-essential tcl curl

# Install redis
WORKDIR /tmp
RUN curl -O http://download.redis.io/redis-stable.tar.gz
RUN tar xzvf redis-stable.tar.gz
WORKDIR redis-stable
RUN make
RUN make test
RUN make install

# Clone PHYLOViZ Online repository
WORKDIR /PHYLOVIZ/
RUN git clone --depth=1 -b phyloviz2.0 https://github.com/bfrgoncalves/Online-PhyloViZ.git && cd Online-PhyloViZ && npm install

# Install pm2
RUN npm install pm2@2.4.0 -g

# Set final workdir
WORKDIR /PHYLOVIZ/Online-PhyloViZ

RUN apt-get remove -y nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y nodejs

# Copy entrypoint for phyloviz
COPY docker-phyloviz-entrypoint.sh docker-phyloviz-entrypoint.sh
RUN chmod +x docker-phyloviz-entrypoint.sh

ENTRYPOINT ["/PHYLOVIZ/Online-PhyloViZ/docker-phyloviz-entrypoint.sh"]