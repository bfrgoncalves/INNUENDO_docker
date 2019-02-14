# INNUENDO Platform Docker-Compose version

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/bc6845f572614778b451b5dbb76a3591)](https://app.codacy.com/app/bfrgoncalves/INNUENDO_docker?utm_source=github.com&utm_medium=referral&utm_content=bfrgoncalves/INNUENDO_docker&utm_campaign=Badge_Grade_Dashboard)
[![Documentation Status](https://readthedocs.org/projects/innuendo/badge/?version=latest)](https://innuendo.readthedocs.io/en/latest/?badge=latest)

INNUENDO Platform made easy!

This repository provides a series of dockerfiles, configuration files and a docker-compose file
to launch the INNUENDO Platform without the requirement of installing every 
component individually.

## Requirements

* Docker
* Docker-compose

## Installation

Check the [documentation](https://innuendo.readthedocs.io/en/latest/docker-compose/docker-compose.html#running-the-innuendo-platform) on how to install the required dependencies.

## Usage

```
# Get the repository source code
get clone https://github.com/bfrgoncalves/INNUENDO_docker.git

# Enter the repository directory
cd INNUENDO_docker

# Run the docker-compose application
docker-compose up

# Access the application at http://localhost
```

The last command will pull all the required images first then it will launch all the Docker containers. They will will communicate between each other by a docker network that is built by default with docker-compose.

## Downloading legacy data and building profile databases

The application provides a script to download all the required files to perform comparisons with some already publicly available strains. This is made through the download of the following data available here:

* chewBBACA schemas
* Legacy strain metadata (for each species)
* Legacy strain profiles (for each species)
* Serotyping files
* Prodigal training files

These data will be available under ./inputs and will be mapped to the docker containers running the application.

The script also build the required files for a rapid comparison between profiles using fast-mlst and populates the mlst_database.

To run the script, type the following command:

```

# Enter repository directory
cd <innuendo_docker_directory>/build_files

# Run script to get legacy input files
./get_inputs.sh

```

These steps might take up to 1h depending on the available internet connection and the host machine.

More information about the software can be found at the [documentation](https://innuendo.readthedocs.io/en/latest/docker-compose/docker-compose.html#running-the-innuendo-platform).
