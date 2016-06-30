#!/usr/bin/env bash
# cmd_extractor  process/ext_relation_formation_global
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"relation_formation_global\"\n\tdeepdive sql 'INSERT INTO relation_formation_global SELECT DISTINCT R0.type AS \"relation_formation.R0.type\", R0.eid1 AS \"relation_formation.R0.eid1\", R0.eid2 AS \"relation_formation.R0.eid2\"\nFROM relation_formation R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_relation_formation"],"input_relations":["relation_formation"],"output_relation":"relation_formation_global","style":"cmd_extractor","dependencies_":["process/ext_relation_formation"],"input_":["data/relation_formation"],"output_":"data/relation_formation_global","name":"process/ext_relation_formation_global"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_relation_formation_global'


	# TODO use temporary table
	deepdive create table "relation_formation_global"
	deepdive sql 'INSERT INTO relation_formation_global SELECT DISTINCT R0.type AS "relation_formation.R0.type", R0.eid1 AS "relation_formation.R0.eid1", R0.eid2 AS "relation_formation.R0.eid2"
FROM relation_formation R0
        '
	# TODO rename temporary table to replace output_relation
	
        



