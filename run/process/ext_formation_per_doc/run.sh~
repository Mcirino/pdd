#!/usr/bin/env bash
# cmd_extractor  process/ext_formation_per_doc
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"formation_per_doc\"\n\tdeepdive sql 'INSERT INTO formation_per_doc SELECT R0.docid AS \"entity_formation_candidate_local.R0.docid\", ARRAY_AGG(R0.entity) AS column_1, ARRAY_AGG(R0.type) AS column_2\nFROM entity_formation_candidate_local R0\n        \n        GROUP BY R0.docid'\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_entity_formation_candidate_local_by_ext_entity_formation_local"],"input_relations":["entity_formation_candidate_local"],"output_relation":"formation_per_doc","style":"cmd_extractor","dependencies_":["process/ext_entity_formation_candidate_local_by_ext_entity_formation_local"],"input_":["data/entity_formation_candidate_local"],"output_":"data/formation_per_doc","name":"process/ext_formation_per_doc"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_formation_per_doc'


	# TODO use temporary table
	deepdive create table "formation_per_doc"
	deepdive sql 'INSERT INTO formation_per_doc SELECT R0.docid AS "entity_formation_candidate_local.R0.docid", ARRAY_AGG(R0.entity) AS column_1, ARRAY_AGG(R0.type) AS column_2
FROM entity_formation_candidate_local R0
        
        GROUP BY R0.docid'
	# TODO rename temporary table to replace output_relation
	
        



