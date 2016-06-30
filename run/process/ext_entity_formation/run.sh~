#!/usr/bin/env bash
# cmd_extractor  process/ext_entity_formation
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"entity_formation\"\n\tdeepdive sql 'INSERT INTO entity_formation SELECT R0.docid AS \"entity_formation_candidate.R0.docid\", R0.type AS \"entity_formation_candidate.R0.type\", R0.eid AS \"entity_formation_candidate.R0.eid\", R0.entity AS \"entity_formation_candidate.R0.entity\", R0.prov AS \"entity_formation_candidate.R0.prov\"\nFROM entity_formation_candidate R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_entity_formation_candidate"],"input_relations":["entity_formation_candidate"],"output_relation":"entity_formation","style":"cmd_extractor","dependencies_":["process/ext_entity_formation_candidate"],"input_":["data/entity_formation_candidate"],"output_":"data/entity_formation","name":"process/ext_entity_formation"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_entity_formation'


	# TODO use temporary table
	deepdive create table "entity_formation"
	deepdive sql 'INSERT INTO entity_formation SELECT R0.docid AS "entity_formation_candidate.R0.docid", R0.type AS "entity_formation_candidate.R0.type", R0.eid AS "entity_formation_candidate.R0.eid", R0.entity AS "entity_formation_candidate.R0.entity", R0.prov AS "entity_formation_candidate.R0.prov"
FROM entity_formation_candidate R0
        '
	# TODO rename temporary table to replace output_relation
	
        



