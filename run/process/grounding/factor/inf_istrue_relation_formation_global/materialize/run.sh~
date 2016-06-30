#!/usr/bin/env bash
# cmd_extractor  process/grounding/factor/inf_istrue_relation_formation_global/materialize
# {"dependencies_":["process/grounding/variable/relation_formation_global/assign_id","process/grounding/variable/relation_formation/assign_id"],"input_":["data/relation_candidates"],"style":"cmd_extractor","cmd":"\n            : ${DEEPDIVE_GROUNDING_DIR:=\"$DEEPDIVE_APP\"/run/model/grounding}\n\n            # materialize factors using user input_query that pulls in assigned ids to involved variables\n            deepdive create table 'dd_factors_inf_istrue_relation_formation_global' as '\n          SELECT R0.id AS \"relation_formation_global.R0.id\" , R1.id AS \"relation_formation.R1.id\" , R2.features AS \"dd_weight_column_0\" \n          FROM relation_formation_global R0, relation_formation R1, relation_candidates R2\n        WHERE R1.type = R0.type  AND R1.eid1 = R0.entity1  AND R1.eid2 = R0.entity2  AND R2.docid = R1.docid  AND R2.eid1 = R0.entity1  AND R2.eid2 = R0.entity2  AND R2.entity1 = R1.entity1  AND R2.entity2 = R1.entity2 '\n\n            # find distinct weights for the factors into a separate table\n            deepdive create table 'dd_weights_inf_istrue_relation_formation_global' as 'SELECT \"dd_weight_column_0\"\n     , false AS \"isfixed\"\n     , 0 AS \"initvalue\"\n     , -1 AS \"id\"\nFROM \"dd_factors_inf_istrue_relation_formation_global\"\n\n\nGROUP BY \"dd_weight_column_0\"'\n        ","name":"process/grounding/factor/inf_istrue_relation_formation_global/materialize"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/grounding/factor/inf_istrue_relation_formation_global/materialize'

            : ${DEEPDIVE_GROUNDING_DIR:="$DEEPDIVE_APP"/run/model/grounding}

            # materialize factors using user input_query that pulls in assigned ids to involved variables
            deepdive create table 'dd_factors_inf_istrue_relation_formation_global' as '
          SELECT R0.id AS "relation_formation_global.R0.id" , R1.id AS "relation_formation.R1.id" , R2.features AS "dd_weight_column_0" 
          FROM relation_formation_global R0, relation_formation R1, relation_candidates R2
        WHERE R1.type = R0.type  AND R1.eid1 = R0.entity1  AND R1.eid2 = R0.entity2  AND R2.docid = R1.docid  AND R2.eid1 = R0.entity1  AND R2.eid2 = R0.entity2  AND R2.entity1 = R1.entity1  AND R2.entity2 = R1.entity2 '

            # find distinct weights for the factors into a separate table
            deepdive create table 'dd_weights_inf_istrue_relation_formation_global' as 'SELECT "dd_weight_column_0"
     , false AS "isfixed"
     , 0 AS "initvalue"
     , -1 AS "id"
FROM "dd_factors_inf_istrue_relation_formation_global"


GROUP BY "dd_weight_column_0"'
        



