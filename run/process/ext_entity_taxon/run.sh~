#!/usr/bin/env bash
# cmd_extractor  process/ext_entity_taxon
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"entity_taxon\"\n\tdeepdive sql 'INSERT INTO entity_taxon SELECT R0.docid AS \"entity_taxon_candidate.R0.docid\", R0.type AS \"entity_taxon_candidate.R0.type\", R0.eid AS \"entity_taxon_candidate.R0.eid\", R0.entity AS \"entity_taxon_candidate.R0.entity\", R0.author_year AS \"entity_taxon_candidate.R0.author_year\", R0.prov AS \"entity_taxon_candidate.R0.prov\"\nFROM entity_taxon_candidate R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_entity_taxon_candidate"],"input_relations":["entity_taxon_candidate"],"output_relation":"entity_taxon","style":"cmd_extractor","dependencies_":["process/ext_entity_taxon_candidate"],"input_":["data/entity_taxon_candidate"],"output_":"data/entity_taxon","name":"process/ext_entity_taxon"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_entity_taxon'


	# TODO use temporary table
	deepdive create table "entity_taxon"
	deepdive sql 'INSERT INTO entity_taxon SELECT R0.docid AS "entity_taxon_candidate.R0.docid", R0.type AS "entity_taxon_candidate.R0.type", R0.eid AS "entity_taxon_candidate.R0.eid", R0.entity AS "entity_taxon_candidate.R0.entity", R0.author_year AS "entity_taxon_candidate.R0.author_year", R0.prov AS "entity_taxon_candidate.R0.prov"
FROM entity_taxon_candidate R0
        '
	# TODO rename temporary table to replace output_relation
	
        



