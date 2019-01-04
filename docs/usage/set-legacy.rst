Set a legacy profiles database
==============================

The INNUENDO Platform allows adding profiles already analysed to the wgMLST
database for comparison. These profiles must have an associated metadata and the
three level profile classification.

This can be made by updating the following files of the `INNUENDO_REST_API`
application, at the `INNUENDO_REST_API/build_files` folder. The files are:

- **build_indexes.sh** - Gets profiles, metadata, and classification. It also adds the information to the new wgMLST database.
- **get_profiles_and_training.sh** - Gets the used wgMLST schema.

The above files should be changed to add according to the modifications
required to insert the data inside the database. Check the documentation inside
the above files for more information regarding each step.

An example of each of the input files can be found:

- `Allelic profiles .tab file <https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/1.1/Yenterocolitica_wgMLST_alleleProfiles.tsv/>`_ (Yersinia enterocolitica)
- `Metadata file <https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/1.1/Yenterocolitica_metadata.txt/>`_ (Yersinia enterocolitica)
- `List of schema core genes <https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/1.1/Yenterocolitica_cgMLST_2406_listGenes.txt/>`_ (Yersinia enterocolitica)
- `Three level classification <https://github.com/bfrgoncalves/INNUENDO_schemas/releases/download/1.1/Yentero_correct_classification.txt/>`_ (Yersinia enterocolitica)
