#!/usr/bin/env bash
# cmd_extractor  process/model/load_probabilities
# {"dependencies_":["model/probabilities"],"output_":"data/model/probabilities","style":"cmd_extractor","cmd":"mkdir -p ../../../model && cd ../../../model\n            # load weights to database\n            deepdive create table dd_inference_result_variables \\\n                id:BIGINT \\\n                category:BIGINT \\\n                expectation:'DOUBLE PRECISION' \\\n                #\n            cat probabilities/inference_result.out.text |\n            tr ' ' '\\t' | DEEPDIVE_LOAD_FORMAT=tsv \\\n            deepdive load dd_inference_result_variables /dev/stdin\n\n            # create a view for each app schema variable\n            \n            deepdive create view 'entity_formation_label_inference' as '\n                SELECT entity_formation.*, mir.category, mir.expectation FROM\n                entity_formation, dd_inference_result_variables mir\n                WHERE entity_formation.id = mir.id\n                ORDER BY mir.expectation DESC\n                '\n\n            deepdive create view 'entity_location_label_inference' as '\n                SELECT entity_location.*, mir.category, mir.expectation FROM\n                entity_location, dd_inference_result_variables mir\n                WHERE entity_location.id = mir.id\n                ORDER BY mir.expectation DESC\n                '\n\n            deepdive create view 'entity_taxon_label_inference' as '\n                SELECT entity_taxon.*, mir.category, mir.expectation FROM\n                entity_taxon, dd_inference_result_variables mir\n                WHERE entity_taxon.id = mir.id\n                ORDER BY mir.expectation DESC\n                '\n\n            deepdive create view 'entity_temporal_label_inference' as '\n                SELECT entity_temporal.*, mir.category, mir.expectation FROM\n                entity_temporal, dd_inference_result_variables mir\n                WHERE entity_temporal.id = mir.id\n                ORDER BY mir.expectation DESC\n                '\n\n            deepdive create view 'relation_formation_label_inference' as '\n                SELECT relation_formation.*, mir.category, mir.expectation FROM\n                relation_formation, dd_inference_result_variables mir\n                WHERE relation_formation.id = mir.id\n                ORDER BY mir.expectation DESC\n                '\n\n            deepdive create view 'relation_formation_global_label_inference' as '\n                SELECT relation_formation_global.*, mir.category, mir.expectation FROM\n                relation_formation_global, dd_inference_result_variables mir\n                WHERE relation_formation_global.id = mir.id\n                ORDER BY mir.expectation DESC\n                '\n\n            deepdive create view 'relation_formationtemporal_label_inference' as '\n                SELECT relation_formationtemporal.*, mir.category, mir.expectation FROM\n                relation_formationtemporal, dd_inference_result_variables mir\n                WHERE relation_formationtemporal.id = mir.id\n                ORDER BY mir.expectation DESC\n                '\n\n            deepdive create view 'relation_formationtemporal_global_label_inference' as '\n                SELECT relation_formationtemporal_global.*, mir.category, mir.expectation FROM\n                relation_formationtemporal_global, dd_inference_result_variables mir\n                WHERE relation_formationtemporal_global.id = mir.id\n                ORDER BY mir.expectation DESC\n                '\n\n            deepdive create view 'relation_taxonomy_label_inference' as '\n                SELECT relation_taxonomy.*, mir.category, mir.expectation FROM\n                relation_taxonomy, dd_inference_result_variables mir\n                WHERE relation_taxonomy.id = mir.id\n                ORDER BY mir.expectation DESC\n                '\n\n            deepdive create view 'relation_taxonomy_global_label_inference' as '\n                SELECT relation_taxonomy_global.*, mir.category, mir.expectation FROM\n                relation_taxonomy_global, dd_inference_result_variables mir\n                WHERE relation_taxonomy_global.id = mir.id\n                ORDER BY mir.expectation DESC\n                '\n        ","name":"process/model/load_probabilities"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/model/load_probabilities'
mkdir -p ../../../model && cd ../../../model
            # load weights to database
            deepdive create table dd_inference_result_variables \
                id:BIGINT \
                category:BIGINT \
                expectation:'DOUBLE PRECISION' \
                #
            cat probabilities/inference_result.out.text |
            tr ' ' '\t' | DEEPDIVE_LOAD_FORMAT=tsv \
            deepdive load dd_inference_result_variables /dev/stdin

            # create a view for each app schema variable
            
            deepdive create view 'entity_formation_label_inference' as '
                SELECT entity_formation.*, mir.category, mir.expectation FROM
                entity_formation, dd_inference_result_variables mir
                WHERE entity_formation.id = mir.id
                ORDER BY mir.expectation DESC
                '

            deepdive create view 'entity_location_label_inference' as '
                SELECT entity_location.*, mir.category, mir.expectation FROM
                entity_location, dd_inference_result_variables mir
                WHERE entity_location.id = mir.id
                ORDER BY mir.expectation DESC
                '

            deepdive create view 'entity_taxon_label_inference' as '
                SELECT entity_taxon.*, mir.category, mir.expectation FROM
                entity_taxon, dd_inference_result_variables mir
                WHERE entity_taxon.id = mir.id
                ORDER BY mir.expectation DESC
                '

            deepdive create view 'entity_temporal_label_inference' as '
                SELECT entity_temporal.*, mir.category, mir.expectation FROM
                entity_temporal, dd_inference_result_variables mir
                WHERE entity_temporal.id = mir.id
                ORDER BY mir.expectation DESC
                '

            deepdive create view 'relation_formation_label_inference' as '
                SELECT relation_formation.*, mir.category, mir.expectation FROM
                relation_formation, dd_inference_result_variables mir
                WHERE relation_formation.id = mir.id
                ORDER BY mir.expectation DESC
                '

            deepdive create view 'relation_formation_global_label_inference' as '
                SELECT relation_formation_global.*, mir.category, mir.expectation FROM
                relation_formation_global, dd_inference_result_variables mir
                WHERE relation_formation_global.id = mir.id
                ORDER BY mir.expectation DESC
                '

            deepdive create view 'relation_formationtemporal_label_inference' as '
                SELECT relation_formationtemporal.*, mir.category, mir.expectation FROM
                relation_formationtemporal, dd_inference_result_variables mir
                WHERE relation_formationtemporal.id = mir.id
                ORDER BY mir.expectation DESC
                '

            deepdive create view 'relation_formationtemporal_global_label_inference' as '
                SELECT relation_formationtemporal_global.*, mir.category, mir.expectation FROM
                relation_formationtemporal_global, dd_inference_result_variables mir
                WHERE relation_formationtemporal_global.id = mir.id
                ORDER BY mir.expectation DESC
                '

            deepdive create view 'relation_taxonomy_label_inference' as '
                SELECT relation_taxonomy.*, mir.category, mir.expectation FROM
                relation_taxonomy, dd_inference_result_variables mir
                WHERE relation_taxonomy.id = mir.id
                ORDER BY mir.expectation DESC
                '

            deepdive create view 'relation_taxonomy_global_label_inference' as '
                SELECT relation_taxonomy_global.*, mir.category, mir.expectation FROM
                relation_taxonomy_global, dd_inference_result_variables mir
                WHERE relation_taxonomy_global.id = mir.id
                ORDER BY mir.expectation DESC
                '
        



