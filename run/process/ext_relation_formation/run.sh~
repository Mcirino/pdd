#!/usr/bin/env bash
# cmd_extractor  process/ext_relation_formation
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"relation_formation\"\n\tdeepdive sql 'INSERT INTO relation_formation SELECT DISTINCT R0.docid, R0.type, R0.eid1, R0.eid2, R0.entity1, R0.entity2, 0 AS id, R0.label AS label\n          FROM relation_formation_supervise R0\n        \n          '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_relation_formation_supervise_by_ext_relation_variable_formation"],"input_relations":["relation_formation_supervise"],"output_relation":"relation_formation","style":"cmd_extractor","dependencies_":["process/ext_relation_formation_supervise_by_ext_relation_variable_formation"],"input_":["data/relation_formation_supervise"],"output_":"data/relation_formation","name":"process/ext_relation_formation"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_relation_formation'


	# TODO use temporary table
	deepdive create table "relation_formation"
	deepdive sql 'INSERT INTO relation_formation SELECT DISTINCT R0.docid, R0.type, R0.eid1, R0.eid2, R0.entity1, R0.entity2, 0 AS id, R0.label AS label
          FROM relation_formation_supervise R0
        
          '
	# TODO rename temporary table to replace output_relation
	
        



