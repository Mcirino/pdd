#!/usr/bin/env bash
# cmd_extractor  process/ext_entity_taxon_candidate
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"entity_taxon_candidate\"\n\tdeepdive sql 'INSERT INTO entity_taxon_candidate SELECT R0.docid AS \"entity_taxon_candidate__0.R0.docid\", R0.type AS \"entity_taxon_candidate__0.R0.type\", R0.eid AS \"entity_taxon_candidate__0.R0.eid\", R0.entity AS \"entity_taxon_candidate__0.R0.entity\", R0.author_year AS \"entity_taxon_candidate__0.R0.author_year\", R0.prov AS \"entity_taxon_candidate__0.R0.prov\"\nFROM entity_taxon_candidate__0 R0\n        \nUNION ALL\nSELECT R0.docid AS \"entity_taxon_candidate_local.R0.docid\", R0.type AS \"entity_taxon_candidate_local.R0.type\", R0.eid AS \"entity_taxon_candidate_local.R0.eid\", R0.entity AS \"entity_taxon_candidate_local.R0.entity\", R0.author_year AS \"entity_taxon_candidate_local.R0.author_year\", R0.prov AS \"entity_taxon_candidate_local.R0.prov\"\nFROM entity_taxon_candidate_local R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_entity_taxon_candidate__0_by_ext_entity_taxon_global","ext_entity_taxon_candidate_local_by_ext_entity_taxon_local"],"input_relations":["entity_taxon_candidate__0","entity_taxon_candidate_local"],"output_relation":"entity_taxon_candidate","style":"cmd_extractor","dependencies_":["process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global","process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local"],"input_":["data/entity_taxon_candidate__0","data/entity_taxon_candidate_local"],"output_":"data/entity_taxon_candidate","name":"process/ext_entity_taxon_candidate"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_entity_taxon_candidate'


	# TODO use temporary table
	deepdive create table "entity_taxon_candidate"
	deepdive sql 'INSERT INTO entity_taxon_candidate SELECT R0.docid AS "entity_taxon_candidate__0.R0.docid", R0.type AS "entity_taxon_candidate__0.R0.type", R0.eid AS "entity_taxon_candidate__0.R0.eid", R0.entity AS "entity_taxon_candidate__0.R0.entity", R0.author_year AS "entity_taxon_candidate__0.R0.author_year", R0.prov AS "entity_taxon_candidate__0.R0.prov"
FROM entity_taxon_candidate__0 R0
        
UNION ALL
SELECT R0.docid AS "entity_taxon_candidate_local.R0.docid", R0.type AS "entity_taxon_candidate_local.R0.type", R0.eid AS "entity_taxon_candidate_local.R0.eid", R0.entity AS "entity_taxon_candidate_local.R0.entity", R0.author_year AS "entity_taxon_candidate_local.R0.author_year", R0.prov AS "entity_taxon_candidate_local.R0.prov"
FROM entity_taxon_candidate_local R0
        '
	# TODO rename temporary table to replace output_relation
	
        



