FROM ubuntu:16.04
MAINTAINER Bruno Gonçalves <bfgoncalves@medicina.ulisboa.pt>

# Create frontend folder
WORKDIR /FlowCraft_inspect/

# Install general dependencies
RUN apt-get update && apt-get install -y git curl sudo gcc g++ make software-properties-common python-software-properties
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y yarn python3.6 python3-pip build-essential tcl libssl-dev libffi-dev python3.6-dev

# Install pipenv
RUN pip3 install pipenv

# Install redis
WORKDIR /tmp
RUN curl -O http://download.redis.io/redis-stable.tar.gz
RUN tar xzvf redis-stable.tar.gz
WORKDIR redis-stable
RUN make
RUN make test
RUN make install

# Clone flowcraft-webapp
WORKDIR /FlowCraft_inspect/
RUN git clone https://github.com/assemblerflow/flowcraft-webapp.git && cd flowcraft-webapp

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# Set final workdir
WORKDIR /FlowCraft_inspect/flowcraft-webapp
COPY Pipfile.lock /FlowCraft_inspect/flowcraft-webapp/Pipfile.lock

RUN pipenv install --system --deploy --ignore-pipfile

RUN cd flowcraft-webapp && yarn install --network-timeout 1000000 && exit

# Copy entrypoint for phyloviz
COPY docker-flowcraft-entrypoint.sh docker-flowcraft-entrypoint.sh
RUN chmod +x docker-flowcraft-entrypoint.sh

ENTRYPOINT ["/FlowCraft_inspect/flowcraft-webapp/docker-flowcraft-entrypoint.sh"]