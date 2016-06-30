#!/usr/bin/env bash
# cmd_extractor  process/ext_relation_formationtemporal_global
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"relation_formationtemporal_global\"\n\tdeepdive sql 'INSERT INTO relation_formationtemporal_global SELECT DISTINCT R0.type AS \"relation_formationtemporal.R0.type\", R0.eid1 AS \"relation_formationtemporal.R0.eid1\", R0.eid2 AS \"relation_formationtemporal.R0.eid2\"\nFROM relation_formationtemporal R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_relation_formationtemporal"],"input_relations":["relation_formationtemporal"],"output_relation":"relation_formationtemporal_global","style":"cmd_extractor","dependencies_":["process/ext_relation_formationtemporal"],"input_":["data/relation_formationtemporal"],"output_":"data/relation_formationtemporal_global","name":"process/ext_relation_formationtemporal_global"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_relation_formationtemporal_global'


	# TODO use temporary table
	deepdive create table "relation_formationtemporal_global"
	deepdive sql 'INSERT INTO relation_formationtemporal_global SELECT DISTINCT R0.type AS "relation_formationtemporal.R0.type", R0.eid1 AS "relation_formationtemporal.R0.eid1", R0.eid2 AS "relation_formationtemporal.R0.eid2"
FROM relation_formationtemporal R0
        '
	# TODO rename temporary table to replace output_relation
	
        



