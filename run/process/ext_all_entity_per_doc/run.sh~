#!/usr/bin/env bash
# cmd_extractor  process/ext_all_entity_per_doc
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"all_entity_per_doc\"\n\tdeepdive sql 'INSERT INTO all_entity_per_doc SELECT R0.docid AS \"all_entity_candidate.R0.docid\", ARRAY_AGG(R0.eid) AS column_1, ARRAY_AGG(R0.entity) AS column_2, ARRAY_AGG(R0.type) AS column_3, ARRAY_AGG(R0.prov) AS column_4\nFROM all_entity_candidate R0\n        \n        GROUP BY R0.docid'\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_all_entity_candidate"],"input_relations":["all_entity_candidate"],"output_relation":"all_entity_per_doc","style":"cmd_extractor","dependencies_":["process/ext_all_entity_candidate"],"input_":["data/all_entity_candidate"],"output_":"data/all_entity_per_doc","name":"process/ext_all_entity_per_doc"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_all_entity_per_doc'


	# TODO use temporary table
	deepdive create table "all_entity_per_doc"
	deepdive sql 'INSERT INTO all_entity_per_doc SELECT R0.docid AS "all_entity_candidate.R0.docid", ARRAY_AGG(R0.eid) AS column_1, ARRAY_AGG(R0.entity) AS column_2, ARRAY_AGG(R0.type) AS column_3, ARRAY_AGG(R0.prov) AS column_4
FROM all_entity_candidate R0
        
        GROUP BY R0.docid'
	# TODO rename temporary table to replace output_relation
	
        



