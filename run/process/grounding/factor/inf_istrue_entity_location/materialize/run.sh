#!/usr/bin/env bash
# cmd_extractor  process/grounding/factor/inf_istrue_entity_location/materialize
# {"dependencies_":["process/grounding/variable/entity_location/assign_id"],"input_":["data/entity_location_candidate"],"style":"cmd_extractor","cmd":"\n            : ${DEEPDIVE_GROUNDING_DIR:=\"$DEEPDIVE_APP\"/run/model/grounding}\n\n            # materialize factors using user input_query that pulls in assigned ids to involved variables\n            deepdive create table 'dd_factors_inf_istrue_entity_location' as '\n          SELECT R0.id AS \"entity_location.R0.id\" , R0.type AS \"dd_weight_column_0\" \n          FROM entity_location R0, entity_location_candidate R1\n        WHERE R1.docid = R0.docid  AND R1.type = R0.type  AND R1.eid = R0.eid  AND R1.entity = R0.entity  AND R1.prov = R0.prov '\n\n            # find distinct weights for the factors into a separate table\n            deepdive create table 'dd_weights_inf_istrue_entity_location' as 'SELECT \"dd_weight_column_0\"\n     , false AS \"isfixed\"\n     , 0 AS \"initvalue\"\n     , -1 AS \"id\"\nFROM \"dd_factors_inf_istrue_entity_location\"\n\n\nGROUP BY \"dd_weight_column_0\"'\n        ","name":"process/grounding/factor/inf_istrue_entity_location/materialize"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/grounding/factor/inf_istrue_entity_location/materialize'

            : ${DEEPDIVE_GROUNDING_DIR:="$DEEPDIVE_APP"/run/model/grounding}

            # materialize factors using user input_query that pulls in assigned ids to involved variables
            deepdive create table 'dd_factors_inf_istrue_entity_location' as '
          SELECT R0.id AS "entity_location.R0.id" , R0.type AS "dd_weight_column_0" 
          FROM entity_location R0, entity_location_candidate R1
        WHERE R1.docid = R0.docid  AND R1.type = R0.type  AND R1.eid = R0.eid  AND R1.entity = R0.entity  AND R1.prov = R0.prov '

            # find distinct weights for the factors into a separate table
            deepdive create table 'dd_weights_inf_istrue_entity_location' as 'SELECT "dd_weight_column_0"
     , false AS "isfixed"
     , 0 AS "initvalue"
     , -1 AS "id"
FROM "dd_factors_inf_istrue_entity_location"


GROUP BY "dd_weight_column_0"'
        


