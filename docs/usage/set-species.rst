Set a new Species
=================

The INNUENDO Platform is **species dependent**. Which means that any project,
protocol or workflow needs to be associated with a species. The scope of the
INNUENDO Project was to develop analysis strategies from 4 target species:
*Escherichia coli*, *Yersinia enterocolitica*, *Salmonella enterica* and
*Campylobacter jejuni*. However, the platform is scalable to add any other
species upon some configuration. In this example we are going to exemplify on
how to add **speciesA**.

1 - Add a new database model
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each species in the INNUENDO Platform has a dedicated wgMLST profile database.
As so, a new model for it needs to be added inside the `app/models/models.py` file.

::

    # Example of adding species A. Inside models.py file near the other mlst
    # database classes

    class SpeciesA(db.Model):
        """
        Defines the species specific storage of profiles and its classification.
        Salmonella specification.
        """

        # Name of the database table
        __tablename__ = "speciesA"

        # The name of the mlst_database
        __bind_key__ = 'mlst_database'

        # Required fields on each wgMLST species database
        id = db.Column(db.Integer(), primary_key=True)
        name = db.Column(db.String(255), unique=True)
        version = db.Column(db.String(255))
        # Platform classifiers
        classifier_l1 = db.Column(db.String(255))
        classifier_l2 = db.Column(db.String(255))
        classifier_l3 = db.Column(db.String(255))
        allelic_profile = db.Column(JSON)
        strain_metadata = db.Column(JSON)
        # Tell if it is legacy or from the platform
        platform_tag = db.Column(db.String(255))
        timestamp = db.Column(db.DateTime)

This new model needs to be loaded with `manage.py` in case of installation
from source. In case of the docker-compose verison, it will be loaded
automatically on start.

2 - Import model on app_configuration.py
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The model needs then to be imported to be used by the application. This can be
made by importing it at `app/app_configuration.py`. The `species_correspondece`
dictionary needs also to be updated to allow association of the models with a key.

::

    # Example of adding speciesA to the model imports at app/app_configuration.py
    from app.models.models import Ecoli, Yersinia, Salmonella, Campylobacter, SpeciesA

    # Change the species_correspondece object to associate model with a key
    database_correspondece = {
        "E.coli": Ecoli,
        "Yersinia": Yersinia,
        "Salmonella": Salmonella,
        "SpeciesA": SpeciesA
    }

3 - Update the config.py files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The `config.py` files need also to be updated in order for the application to
know which species should use, the classification levels,
and which files use for wgMLST database.

**Updating config.py on INNUENDO_REST_API application**

::

    # Example of config.py updates for speciesA

    # Add speciesA to the list with all the available species
    # NOTE: the name needs to be the same as the key used in the
    # database_correspondece on step 2
    ALL_SPECIES = [
        "E.coli",
        "Yersinia",
        "Campylobacter",
        "Salmonella",
        "SpeciesA"
    ]

    # Add the  Association between species ID in the platform with the species name
    SPECIES_CORRESPONDENCE = {
        "E.coli": "Escherichia coli",
        "Yersinia": "Yersinia enterocolitica",
        "Salmonella": "Salmonella enterica",
        "Campylobacter": "Campylobacter jejuni"
        "SpeciesA": "Species A real name"
    };

    # Add the wgMLST fast-mlst index file correspondence
    wg_index_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_wg",
            "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_wg",
            "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_wg",
            "SpeciesA": "/INNUENDO/inputs/v1/indexes/speciesA_wg"
        }
    }

    # Add Path to the core index file used by fast-mlst for profile search up to x
    # differences
    core_index_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_core",
            "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_core",
            "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_core",
            "SpeciesA": "/INNUENDO/inputs/v1/indexes/speciesA_core"
        }
    }

    # Add Path to the list of the wg loci for each species
    wg_headers_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/core_lists/ecoli_headers_wg.txt",
            "Yersinia": "/INNUENDO/inputs/v1/core_lists/yersinia_headers_wg.txt",
            "Salmonella": "/INNUENDO/inputs/v1/core_lists/salmonella_headers_wg.txt",
            "SpeciesA": "/INNUENDO/inputs/v1/core_lists/speciesA_headers_wg.txt"
        }
    }

    # Add Path to the list of the core loci for each species
    core_headers_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/core_lists/ecoli_headers_core.txt",
            "Yersinia": "/INNUENDO/inputs/v1/core_lists/yersinia_headers_core.txt",
            "Salmonella": "/INNUENDO/inputs/v1/core_lists/salmonella_headers_core.txt",
            "SpeciesA": "/INNUENDO/inputs/v1/core_lists/speciesA_headers_core.txt"
        }
    }

    # Add Location of the file with the core profiles for each species. Used to
    # contruct the search index
    core_increment_profile_file_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_core_profiles.tab",
            "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_core_profiles.tab",
            "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_core_profiles.tab",
            "SpeciesA": "/INNUENDO/inputs/v1/indexes/speciesA_core_profiles.tab"
        }
    }

    # Add Location of the file with wg profiles for each species. Used to contruct the
    # search index
    wg_increment_profile_file_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_wg_profiles.tab",
            "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_wg_profiles.tab",
            "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_wg_profiles.tab",
            "Campylobacter": "/INNUENDO/inputs/v1/indexes/campy_wg_profiles.tab"
            "SpeciesA": "/INNUENDO/inputs/v1/indexes/speciesA_wg_profiles.tab"
        }
    }

**Updating config.py on INNUENDO_PROCESS_CONTROLLER application**

::

    # Add chewBBACA prodigal training file if not assigned in the protocol
    CHEWBBACA_TRAINING_FILE = {
        "E.coli": "/INNUENDO/inputs/prodigal_training_files/prodigal_training_files/Escherichia_coli.trn",
        "Yersinia": "/INNUENDO/inputs/prodigal_training_files/prodigal_training_files/Yersinia_enterocolitica.trn",
        "Campylobacter": "/INNUENDO/inputs/prodigal_training_files/prodigal_training_files/Campylobacter_jejuni.trn",
        "Salmonella": "/INNUENDO/inputs/prodigal_training_files/prodigal_training_files/Salmonella_enterica.trn"
        "SpeciesA": "/prodigal/training/file/location"
    }

    # Add name user for chewBBACA in case not assigned in the protocol
    CHEWBBACA_CORRESPONDENCE = {
        "E.coli": "Escherichia coli",
        "Yersinia": "Yersinia enterocolitica",
        "Campylobacter": "Campylobacter jejuni",
        "Salmonella": "Salmonella enterica",
        "SpeciesA": "Species a"
    }

    # Add Torsten's mlst correspondence
    MLST_CORRESPONDENCE = {
        "E.coli": "ecoli",
        "Yersinia": "yersinia",
        "Campylobacter": "campylobacter",
        "Salmonella": "senterica",
        "SpeciesA": "speciesa"

    }

    # Add the wgMLST fast-mlst index file correspondence
    wg_index_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_wg",
            "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_wg",
            "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_wg",
            "SpeciesA": "/INNUENDO/inputs/v1/indexes/speciesA_wg"
        }
    }

    # Add Path to the core index file used by fast-mlst for profile search up to x
    # differences
    core_index_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_core",
            "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_core",
            "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_core",
            "SpeciesA": "/INNUENDO/inputs/v1/indexes/speciesA_core"
        }
    }

    # Add Path to the list of the wg loci for each species
    wg_headers_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/core_lists/ecoli_headers_wg.txt",
            "Yersinia": "/INNUENDO/inputs/v1/core_lists/yersinia_headers_wg.txt",
            "Salmonella": "/INNUENDO/inputs/v1/core_lists/salmonella_headers_wg.txt",
            "SpeciesA": "/INNUENDO/inputs/v1/core_lists/speciesA_headers_wg.txt"
        }
    }

    # Add Path to the list of the core loci for each species
    core_headers_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/core_lists/ecoli_headers_core.txt",
            "Yersinia": "/INNUENDO/inputs/v1/core_lists/yersinia_headers_core.txt",
            "Salmonella": "/INNUENDO/inputs/v1/core_lists/salmonella_headers_core.txt",
            "SpeciesA": "/INNUENDO/inputs/v1/core_lists/speciesA_headers_core.txt"
        }
    }

    # Add Location of the file with the core profiles for each species. Used to
    # contruct the search index
    core_increment_profile_file_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_core_profiles.tab",
            "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_core_profiles.tab",
            "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_core_profiles.tab",
            "SpeciesA": "/INNUENDO/inputs/v1/indexes/speciesA_core_profiles.tab"
        }
    }

    # Add Location of the file with wg profiles for each species. Used to contruct the
    # search index
    wg_increment_profile_file_correspondece = {
        "v1": {
            "E.coli": "/INNUENDO/inputs/v1/indexes/ecoli_wg_profiles.tab",
            "Yersinia": "/INNUENDO/inputs/v1/indexes/yersinia_wg_profiles.tab",
            "Salmonella": "/INNUENDO/inputs/v1/indexes/salmonella_wg_profiles.tab",
            "Campylobacter": "/INNUENDO/inputs/v1/indexes/campy_wg_profiles.tab"
            "SpeciesA": "/INNUENDO/inputs/v1/indexes/speciesA_wg_profiles.tab"
        }
    }

    # Update the expected genome size of SpeciesA
    species_expected_genome_size = {
        "E.coli": "5",
        "Yersinia": "4.7",
        "Salmonella": "4.6",
        "Campylobacter": "1.6",
        "SpeciesA": "GenomeSize"
    }

