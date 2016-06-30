#!/usr/bin/env bash
# cmd_extractor  process/ext_document_with_taxon_entities
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"document_with_taxon_entities\"\n\tdeepdive sql 'INSERT INTO document_with_taxon_entities SELECT R0.docid AS \"taxon_per_doc.R0.docid\", array_to_string(R0.entity, '\\''@@@@@'\\'') AS column_1, array_to_string(R0.type, '\\''@@@@@'\\'') AS column_2, R1.sentids AS \"documents_serialized.R1.sentids\", R1.wordidxs AS \"documents_serialized.R1.wordidxs\", R1.words AS \"documents_serialized.R1.words\", R1.poses AS \"documents_serialized.R1.poses\", R1.ners AS \"documents_serialized.R1.ners\", R1.lemmas AS \"documents_serialized.R1.lemmas\", R1.dep_paths AS \"documents_serialized.R1.dep_paths\", R1.dep_parents AS \"documents_serialized.R1.dep_parents\", R1.font AS \"documents_serialized.R1.font\", R1.layout AS \"documents_serialized.R1.layout\"\nFROM taxon_per_doc R0, documents_serialized R1\n        WHERE R1.docid = R0.docid '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_taxon_per_doc","ext_documents_serialized"],"input_relations":["taxon_per_doc","documents_serialized"],"output_relation":"document_with_taxon_entities","style":"cmd_extractor","dependencies_":["process/ext_taxon_per_doc","process/ext_documents_serialized"],"input_":["data/taxon_per_doc","data/documents_serialized"],"output_":"data/document_with_taxon_entities","name":"process/ext_document_with_taxon_entities"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_document_with_taxon_entities'


	# TODO use temporary table
	deepdive create table "document_with_taxon_entities"
	deepdive sql 'INSERT INTO document_with_taxon_entities SELECT R0.docid AS "taxon_per_doc.R0.docid", array_to_string(R0.entity, '\''@@@@@'\'') AS column_1, array_to_string(R0.type, '\''@@@@@'\'') AS column_2, R1.sentids AS "documents_serialized.R1.sentids", R1.wordidxs AS "documents_serialized.R1.wordidxs", R1.words AS "documents_serialized.R1.words", R1.poses AS "documents_serialized.R1.poses", R1.ners AS "documents_serialized.R1.ners", R1.lemmas AS "documents_serialized.R1.lemmas", R1.dep_paths AS "documents_serialized.R1.dep_paths", R1.dep_parents AS "documents_serialized.R1.dep_parents", R1.font AS "documents_serialized.R1.font", R1.layout AS "documents_serialized.R1.layout"
FROM taxon_per_doc R0, documents_serialized R1
        WHERE R1.docid = R0.docid '
	# TODO rename temporary table to replace output_relation
	
        



