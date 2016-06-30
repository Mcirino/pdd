#!/usr/bin/env bash
# cmd_extractor  process/ext_entity_location
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"entity_location\"\n\tdeepdive sql 'INSERT INTO entity_location SELECT R0.docid AS \"entity_location_candidate.R0.docid\", R0.type AS \"entity_location_candidate.R0.type\", R0.eid AS \"entity_location_candidate.R0.eid\", R0.entity AS \"entity_location_candidate.R0.entity\", R0.prov AS \"entity_location_candidate.R0.prov\"\nFROM entity_location_candidate R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_entity_location_candidate_by_ext_entity_location_global"],"input_relations":["entity_location_candidate"],"output_relation":"entity_location","style":"cmd_extractor","dependencies_":["process/ext_entity_location_candidate_by_ext_entity_location_global"],"input_":["data/entity_location_candidate"],"output_":"data/entity_location","name":"process/ext_entity_location"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_entity_location'


	# TODO use temporary table
	deepdive create table "entity_location"
	deepdive sql 'INSERT INTO entity_location SELECT R0.docid AS "entity_location_candidate.R0.docid", R0.type AS "entity_location_candidate.R0.type", R0.eid AS "entity_location_candidate.R0.eid", R0.entity AS "entity_location_candidate.R0.entity", R0.prov AS "entity_location_candidate.R0.prov"
FROM entity_location_candidate R0
        '
	# TODO rename temporary table to replace output_relation
	
        



