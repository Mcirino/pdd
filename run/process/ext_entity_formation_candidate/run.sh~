#!/usr/bin/env bash
# cmd_extractor  process/ext_entity_formation_candidate
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"entity_formation_candidate\"\n\tdeepdive sql 'INSERT INTO entity_formation_candidate SELECT R0.docid AS \"entity_formation_candidate__0.R0.docid\", R0.type AS \"entity_formation_candidate__0.R0.type\", R0.eid AS \"entity_formation_candidate__0.R0.eid\", R0.entity AS \"entity_formation_candidate__0.R0.entity\", R0.prov AS \"entity_formation_candidate__0.R0.prov\"\nFROM entity_formation_candidate__0 R0\n        \nUNION ALL\nSELECT R0.docid AS \"entity_formation_candidate_local.R0.docid\", R0.type AS \"entity_formation_candidate_local.R0.type\", R0.eid AS \"entity_formation_candidate_local.R0.eid\", R0.entity AS \"entity_formation_candidate_local.R0.entity\", R0.prov AS \"entity_formation_candidate_local.R0.prov\"\nFROM entity_formation_candidate_local R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_entity_formation_candidate__0_by_ext_entity_formation_global","ext_entity_formation_candidate_local_by_ext_entity_formation_local"],"input_relations":["entity_formation_candidate__0","entity_formation_candidate_local"],"output_relation":"entity_formation_candidate","style":"cmd_extractor","dependencies_":["process/ext_entity_formation_candidate__0_by_ext_entity_formation_global","process/ext_entity_formation_candidate_local_by_ext_entity_formation_local"],"input_":["data/entity_formation_candidate__0","data/entity_formation_candidate_local"],"output_":"data/entity_formation_candidate","name":"process/ext_entity_formation_candidate"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_entity_formation_candidate'


	# TODO use temporary table
	deepdive create table "entity_formation_candidate"
	deepdive sql 'INSERT INTO entity_formation_candidate SELECT R0.docid AS "entity_formation_candidate__0.R0.docid", R0.type AS "entity_formation_candidate__0.R0.type", R0.eid AS "entity_formation_candidate__0.R0.eid", R0.entity AS "entity_formation_candidate__0.R0.entity", R0.prov AS "entity_formation_candidate__0.R0.prov"
FROM entity_formation_candidate__0 R0
        
UNION ALL
SELECT R0.docid AS "entity_formation_candidate_local.R0.docid", R0.type AS "entity_formation_candidate_local.R0.type", R0.eid AS "entity_formation_candidate_local.R0.eid", R0.entity AS "entity_formation_candidate_local.R0.entity", R0.prov AS "entity_formation_candidate_local.R0.prov"
FROM entity_formation_candidate_local R0
        '
	# TODO rename temporary table to replace output_relation
	
        



