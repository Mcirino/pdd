#!/usr/bin/env bash
# cmd_extractor  process/grounding/factor/inf_istrue_relation_formationtemporal/materialize
# {"dependencies_":["process/grounding/variable/relation_formationtemporal/assign_id","process/grounding/variable/entity_formation/assign_id","process/grounding/variable/entity_temporal/assign_id"],"input_":["data/relation_candidates"],"style":"cmd_extractor","cmd":"\n            : ${DEEPDIVE_GROUNDING_DIR:=\"$DEEPDIVE_APP\"/run/model/grounding}\n\n            # materialize factors using user input_query that pulls in assigned ids to involved variables\n            deepdive create table 'dd_factors_inf_istrue_relation_formationtemporal' as '\n          SELECT R0.id AS \"relation_formationtemporal.R0.id\" , R2.id AS \"entity_formation.R2.id\" , R3.id AS \"entity_temporal.R3.id\" , R1.features AS \"dd_weight_column_0\" \n          FROM relation_formationtemporal R0, relation_candidates R1, entity_formation R2, entity_temporal R3\n        WHERE R1.docid = R0.docid  AND R1.type = '\\''FORMATIONINTERVAL'\\'' AND R1.eid1 = R0.eid1  AND R1.eid2 = R0.eid2  AND R1.entity1 = R0.entity1  AND R1.entity2 = R0.entity2  AND R2.docid = R0.docid  AND R2.eid = R0.eid1  AND R2.entity = R0.entity1  AND R3.docid = R0.docid  AND R3.eid = R0.eid2  AND R3.entity = R0.entity2 '\n\n            # find distinct weights for the factors into a separate table\n            deepdive create table 'dd_weights_inf_istrue_relation_formationtemporal' as 'SELECT \"dd_weight_column_0\"\n     , false AS \"isfixed\"\n     , 0 AS \"initvalue\"\n     , -1 AS \"id\"\nFROM \"dd_factors_inf_istrue_relation_formationtemporal\"\n\n\nGROUP BY \"dd_weight_column_0\"'\n        ","name":"process/grounding/factor/inf_istrue_relation_formationtemporal/materialize"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/grounding/factor/inf_istrue_relation_formationtemporal/materialize'

            : ${DEEPDIVE_GROUNDING_DIR:="$DEEPDIVE_APP"/run/model/grounding}

            # materialize factors using user input_query that pulls in assigned ids to involved variables
            deepdive create table 'dd_factors_inf_istrue_relation_formationtemporal' as '
          SELECT R0.id AS "relation_formationtemporal.R0.id" , R2.id AS "entity_formation.R2.id" , R3.id AS "entity_temporal.R3.id" , R1.features AS "dd_weight_column_0" 
          FROM relation_formationtemporal R0, relation_candidates R1, entity_formation R2, entity_temporal R3
        WHERE R1.docid = R0.docid  AND R1.type = '\''FORMATIONINTERVAL'\'' AND R1.eid1 = R0.eid1  AND R1.eid2 = R0.eid2  AND R1.entity1 = R0.entity1  AND R1.entity2 = R0.entity2  AND R2.docid = R0.docid  AND R2.eid = R0.eid1  AND R2.entity = R0.entity1  AND R3.docid = R0.docid  AND R3.eid = R0.eid2  AND R3.entity = R0.entity2 '

            # find distinct weights for the factors into a separate table
            deepdive create table 'dd_weights_inf_istrue_relation_formationtemporal' as 'SELECT "dd_weight_column_0"
     , false AS "isfixed"
     , 0 AS "initvalue"
     , -1 AS "id"
FROM "dd_factors_inf_istrue_relation_formationtemporal"


GROUP BY "dd_weight_column_0"'
        



