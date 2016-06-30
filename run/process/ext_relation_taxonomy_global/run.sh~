#!/usr/bin/env bash
# cmd_extractor  process/ext_relation_taxonomy_global
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"relation_taxonomy_global\"\n\tdeepdive sql 'INSERT INTO relation_taxonomy_global SELECT DISTINCT R0.type AS \"relation_taxonomy.R0.type\", R0.eid1 AS \"relation_taxonomy.R0.eid1\", R0.eid2 AS \"relation_taxonomy.R0.eid2\"\nFROM relation_taxonomy R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_relation_taxonomy"],"input_relations":["relation_taxonomy"],"output_relation":"relation_taxonomy_global","style":"cmd_extractor","dependencies_":["process/ext_relation_taxonomy"],"input_":["data/relation_taxonomy"],"output_":"data/relation_taxonomy_global","name":"process/ext_relation_taxonomy_global"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_relation_taxonomy_global'


	# TODO use temporary table
	deepdive create table "relation_taxonomy_global"
	deepdive sql 'INSERT INTO relation_taxonomy_global SELECT DISTINCT R0.type AS "relation_taxonomy.R0.type", R0.eid1 AS "relation_taxonomy.R0.eid1", R0.eid2 AS "relation_taxonomy.R0.eid2"
FROM relation_taxonomy R0
        '
	# TODO rename temporary table to replace output_relation
	
        



