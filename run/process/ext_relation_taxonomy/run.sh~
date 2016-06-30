#!/usr/bin/env bash
# cmd_extractor  process/ext_relation_taxonomy
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"relation_taxonomy\"\n\tdeepdive sql 'INSERT INTO relation_taxonomy SELECT DISTINCT R0.docid, R0.type, R0.eid1, R0.eid2, R0.entity1, R0.entity2, 0 AS id, R0.label AS label\n          FROM relation_taxonomy_supervise R0\n        \n          '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy"],"input_relations":["relation_taxonomy_supervise"],"output_relation":"relation_taxonomy","style":"cmd_extractor","dependencies_":["process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy"],"input_":["data/relation_taxonomy_supervise"],"output_":"data/relation_taxonomy","name":"process/ext_relation_taxonomy"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_relation_taxonomy'


	# TODO use temporary table
	deepdive create table "relation_taxonomy"
	deepdive sql 'INSERT INTO relation_taxonomy SELECT DISTINCT R0.docid, R0.type, R0.eid1, R0.eid2, R0.entity1, R0.entity2, 0 AS id, R0.label AS label
          FROM relation_taxonomy_supervise R0
        
          '
	# TODO rename temporary table to replace output_relation
	
        



