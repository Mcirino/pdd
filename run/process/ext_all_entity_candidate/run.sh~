#!/usr/bin/env bash
# cmd_extractor  process/ext_all_entity_candidate
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"all_entity_candidate\"\n\tdeepdive sql 'INSERT INTO all_entity_candidate SELECT R0.docid AS \"entity_formation_candidate.R0.docid\", '\\''FORMATION'\\'' AS column_1, R0.eid AS \"entity_formation_candidate.R0.eid\", R0.entity AS \"entity_formation_candidate.R0.entity\", R0.prov AS \"entity_formation_candidate.R0.prov\"\nFROM entity_formation_candidate R0\n        \nUNION ALL\nSELECT R0.docid AS \"entity_temporal_candidate.R0.docid\", '\\''INTERVAL'\\'' AS column_1, R0.eid AS \"entity_temporal_candidate.R0.eid\", R0.entity AS \"entity_temporal_candidate.R0.entity\", R0.prov AS \"entity_temporal_candidate.R0.prov\"\nFROM entity_temporal_candidate R0\n        \nUNION ALL\nSELECT R0.docid AS \"entity_taxon_candidate.R0.docid\", '\\''TAXON-'\\'' || R0.type AS column_1, R0.eid AS \"entity_taxon_candidate.R0.eid\", R0.entity AS \"entity_taxon_candidate.R0.entity\", R0.prov AS \"entity_taxon_candidate.R0.prov\"\nFROM entity_taxon_candidate R0\n        \nUNION ALL\nSELECT R0.docid AS \"entity_location_candidate.R0.docid\", '\\''LOCATION'\\'' AS column_1, R0.eid AS \"entity_location_candidate.R0.eid\", R0.entity AS \"entity_location_candidate.R0.entity\", R0.prov AS \"entity_location_candidate.R0.prov\"\nFROM entity_location_candidate R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_entity_formation_candidate","ext_entity_temporal_candidate_by_ext_entity_temporal_local","ext_entity_taxon_candidate","ext_entity_location_candidate_by_ext_entity_location_global"],"input_relations":["entity_formation_candidate","entity_temporal_candidate","entity_taxon_candidate","entity_location_candidate"],"output_relation":"all_entity_candidate","style":"cmd_extractor","dependencies_":["process/ext_entity_formation_candidate","process/ext_entity_temporal_candidate_by_ext_entity_temporal_local","process/ext_entity_taxon_candidate","process/ext_entity_location_candidate_by_ext_entity_location_global"],"input_":["data/entity_formation_candidate","data/entity_temporal_candidate","data/entity_taxon_candidate","data/entity_location_candidate"],"output_":"data/all_entity_candidate","name":"process/ext_all_entity_candidate"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_all_entity_candidate'


	# TODO use temporary table
	deepdive create table "all_entity_candidate"
	deepdive sql 'INSERT INTO all_entity_candidate SELECT R0.docid AS "entity_formation_candidate.R0.docid", '\''FORMATION'\'' AS column_1, R0.eid AS "entity_formation_candidate.R0.eid", R0.entity AS "entity_formation_candidate.R0.entity", R0.prov AS "entity_formation_candidate.R0.prov"
FROM entity_formation_candidate R0
        
UNION ALL
SELECT R0.docid AS "entity_temporal_candidate.R0.docid", '\''INTERVAL'\'' AS column_1, R0.eid AS "entity_temporal_candidate.R0.eid", R0.entity AS "entity_temporal_candidate.R0.entity", R0.prov AS "entity_temporal_candidate.R0.prov"
FROM entity_temporal_candidate R0
        
UNION ALL
SELECT R0.docid AS "entity_taxon_candidate.R0.docid", '\''TAXON-'\'' || R0.type AS column_1, R0.eid AS "entity_taxon_candidate.R0.eid", R0.entity AS "entity_taxon_candidate.R0.entity", R0.prov AS "entity_taxon_candidate.R0.prov"
FROM entity_taxon_candidate R0
        
UNION ALL
SELECT R0.docid AS "entity_location_candidate.R0.docid", '\''LOCATION'\'' AS column_1, R0.eid AS "entity_location_candidate.R0.eid", R0.entity AS "entity_location_candidate.R0.entity", R0.prov AS "entity_location_candidate.R0.prov"
FROM entity_location_candidate R0
        '
	# TODO rename temporary table to replace output_relation
	
        



