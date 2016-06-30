#!/usr/bin/env bash
# cmd_extractor  process/ext_relation_formationtemporal
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"relation_formationtemporal\"\n\tdeepdive sql 'INSERT INTO relation_formationtemporal SELECT DISTINCT R0.docid, R0.type, R0.eid1, R0.eid2, R0.entity1, R0.entity2, 0 AS id, R0.label AS label\n          FROM relation_formationtemporal_supervise R0\n        \n          '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal"],"input_relations":["relation_formationtemporal_supervise"],"output_relation":"relation_formationtemporal","style":"cmd_extractor","dependencies_":["process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal"],"input_":["data/relation_formationtemporal_supervise"],"output_":"data/relation_formationtemporal","name":"process/ext_relation_formationtemporal"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_relation_formationtemporal'


	# TODO use temporary table
	deepdive create table "relation_formationtemporal"
	deepdive sql 'INSERT INTO relation_formationtemporal SELECT DISTINCT R0.docid, R0.type, R0.eid1, R0.eid2, R0.entity1, R0.entity2, 0 AS id, R0.label AS label
          FROM relation_formationtemporal_supervise R0
        
          '
	# TODO rename temporary table to replace output_relation
	
        



