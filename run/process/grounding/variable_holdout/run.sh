#!/usr/bin/env bash
# cmd_extractor  process/grounding/variable_holdout
# {"dependencies_":["process/grounding/variable/entity_formation/assign_id","process/grounding/variable/entity_location/assign_id","process/grounding/variable/entity_taxon/assign_id","process/grounding/variable/entity_temporal/assign_id","process/grounding/variable/relation_formation/assign_id","process/grounding/variable/relation_formation_global/assign_id","process/grounding/variable/relation_formationtemporal/assign_id","process/grounding/variable/relation_formationtemporal_global/assign_id","process/grounding/variable/relation_taxonomy/assign_id","process/grounding/variable/relation_taxonomy_global/assign_id"],"style":"cmd_extractor","cmd":"\n        : ${DEEPDIVE_GROUNDING_DIR:=\"$DEEPDIVE_APP\"/run/model/grounding}\n\n        deepdive create table 'dd_graph_variables_holdout' \\\n            variable_id:BIGINT:'PRIMARY KEY' \\\n            #\n        deepdive create table 'dd_graph_variables_observation' \\\n            variable_id:BIGINT:'PRIMARY KEY' \\\n            #\n        deepdive sql '\n                INSERT INTO \"dd_graph_variables_holdout\" SELECT \"id\"\nFROM \"entity_formation\"\n\nWHERE \"label\" IS NOT NULL AND RANDOM() < null;\n            '\ndeepdive sql '\n                INSERT INTO \"dd_graph_variables_holdout\" SELECT \"id\"\nFROM \"entity_location\"\n\nWHERE \"label\" IS NOT NULL AND RANDOM() < null;\n            '\ndeepdive sql '\n                INSERT INTO \"dd_graph_variables_holdout\" SELECT \"id\"\nFROM \"entity_taxon\"\n\nWHERE \"label\" IS NOT NULL AND RANDOM() < null;\n            '\ndeepdive sql '\n                INSERT INTO \"dd_graph_variables_holdout\" SELECT \"id\"\nFROM \"entity_temporal\"\n\nWHERE \"label\" IS NOT NULL AND RANDOM() < null;\n            '\ndeepdive sql '\n                INSERT INTO \"dd_graph_variables_holdout\" SELECT \"id\"\nFROM \"relation_formation\"\n\nWHERE \"label\" IS NOT NULL AND RANDOM() < null;\n            '\ndeepdive sql '\n                INSERT INTO \"dd_graph_variables_holdout\" SELECT \"id\"\nFROM \"relation_formation_global\"\n\nWHERE \"label\" IS NOT NULL AND RANDOM() < null;\n            '\ndeepdive sql '\n                INSERT INTO \"dd_graph_variables_holdout\" SELECT \"id\"\nFROM \"relation_formationtemporal\"\n\nWHERE \"label\" IS NOT NULL AND RANDOM() < null;\n            '\ndeepdive sql '\n                INSERT INTO \"dd_graph_variables_holdout\" SELECT \"id\"\nFROM \"relation_formationtemporal_global\"\n\nWHERE \"label\" IS NOT NULL AND RANDOM() < null;\n            '\ndeepdive sql '\n                INSERT INTO \"dd_graph_variables_holdout\" SELECT \"id\"\nFROM \"relation_taxonomy\"\n\nWHERE \"label\" IS NOT NULL AND RANDOM() < null;\n            '\ndeepdive sql '\n                INSERT INTO \"dd_graph_variables_holdout\" SELECT \"id\"\nFROM \"relation_taxonomy_global\"\n\nWHERE \"label\" IS NOT NULL AND RANDOM() < null;\n            '\n        ","name":"process/grounding/variable_holdout"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/grounding/variable_holdout'

        : ${DEEPDIVE_GROUNDING_DIR:="$DEEPDIVE_APP"/run/model/grounding}

        deepdive create table 'dd_graph_variables_holdout' \
            variable_id:BIGINT:'PRIMARY KEY' \
            #
        deepdive create table 'dd_graph_variables_observation' \
            variable_id:BIGINT:'PRIMARY KEY' \
            #
        deepdive sql '
                INSERT INTO "dd_graph_variables_holdout" SELECT "id"
FROM "entity_formation"

WHERE "label" IS NOT NULL AND RANDOM() < null;
            '
deepdive sql '
                INSERT INTO "dd_graph_variables_holdout" SELECT "id"
FROM "entity_location"

WHERE "label" IS NOT NULL AND RANDOM() < null;
            '
deepdive sql '
                INSERT INTO "dd_graph_variables_holdout" SELECT "id"
FROM "entity_taxon"

WHERE "label" IS NOT NULL AND RANDOM() < null;
            '
deepdive sql '
                INSERT INTO "dd_graph_variables_holdout" SELECT "id"
FROM "entity_temporal"

WHERE "label" IS NOT NULL AND RANDOM() < null;
            '
deepdive sql '
                INSERT INTO "dd_graph_variables_holdout" SELECT "id"
FROM "relation_formation"

WHERE "label" IS NOT NULL AND RANDOM() < null;
            '
deepdive sql '
                INSERT INTO "dd_graph_variables_holdout" SELECT "id"
FROM "relation_formation_global"

WHERE "label" IS NOT NULL AND RANDOM() < null;
            '
deepdive sql '
                INSERT INTO "dd_graph_variables_holdout" SELECT "id"
FROM "relation_formationtemporal"

WHERE "label" IS NOT NULL AND RANDOM() < null;
            '
deepdive sql '
                INSERT INTO "dd_graph_variables_holdout" SELECT "id"
FROM "relation_formationtemporal_global"

WHERE "label" IS NOT NULL AND RANDOM() < null;
            '
deepdive sql '
                INSERT INTO "dd_graph_variables_holdout" SELECT "id"
FROM "relation_taxonomy"

WHERE "label" IS NOT NULL AND RANDOM() < null;
            '
deepdive sql '
                INSERT INTO "dd_graph_variables_holdout" SELECT "id"
FROM "relation_taxonomy_global"

WHERE "label" IS NOT NULL AND RANDOM() < null;
            '
        



