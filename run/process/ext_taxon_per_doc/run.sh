#!/usr/bin/env bash
# cmd_extractor  process/ext_taxon_per_doc
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"taxon_per_doc\"\n\tdeepdive sql 'INSERT INTO taxon_per_doc SELECT R0.docid AS \"entity_taxon_candidate_local.R0.docid\", ARRAY_AGG(R0.entity) AS column_1, ARRAY_AGG(R0.type) AS column_2\nFROM entity_taxon_candidate_local R0\n        \n        GROUP BY R0.docid'\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_entity_taxon_candidate_local_by_ext_entity_taxon_local"],"input_relations":["entity_taxon_candidate_local"],"output_relation":"taxon_per_doc","style":"cmd_extractor","dependencies_":["process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local"],"input_":["data/entity_taxon_candidate_local"],"output_":"data/taxon_per_doc","name":"process/ext_taxon_per_doc"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_taxon_per_doc'


	# TODO use temporary table
	deepdive create table "taxon_per_doc"
	deepdive sql 'INSERT INTO taxon_per_doc SELECT R0.docid AS "entity_taxon_candidate_local.R0.docid", ARRAY_AGG(R0.entity) AS column_1, ARRAY_AGG(R0.type) AS column_2
FROM entity_taxon_candidate_local R0
        
        GROUP BY R0.docid'
	# TODO rename temporary table to replace output_relation
	
        



