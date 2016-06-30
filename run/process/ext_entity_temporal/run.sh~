#!/usr/bin/env bash
# cmd_extractor  process/ext_entity_temporal
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"entity_temporal\"\n\tdeepdive sql 'INSERT INTO entity_temporal SELECT R0.docid AS \"entity_temporal_candidate.R0.docid\", R0.type AS \"entity_temporal_candidate.R0.type\", R0.eid AS \"entity_temporal_candidate.R0.eid\", R0.entity AS \"entity_temporal_candidate.R0.entity\", R0.prov AS \"entity_temporal_candidate.R0.prov\"\nFROM entity_temporal_candidate R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_entity_temporal_candidate_by_ext_entity_temporal_local"],"input_relations":["entity_temporal_candidate"],"output_relation":"entity_temporal","style":"cmd_extractor","dependencies_":["process/ext_entity_temporal_candidate_by_ext_entity_temporal_local"],"input_":["data/entity_temporal_candidate"],"output_":"data/entity_temporal","name":"process/ext_entity_temporal"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_entity_temporal'


	# TODO use temporary table
	deepdive create table "entity_temporal"
	deepdive sql 'INSERT INTO entity_temporal SELECT R0.docid AS "entity_temporal_candidate.R0.docid", R0.type AS "entity_temporal_candidate.R0.type", R0.eid AS "entity_temporal_candidate.R0.eid", R0.entity AS "entity_temporal_candidate.R0.entity", R0.prov AS "entity_temporal_candidate.R0.prov"
FROM entity_temporal_candidate R0
        '
	# TODO rename temporary table to replace output_relation
	
        



