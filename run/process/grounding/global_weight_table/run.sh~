#!/usr/bin/env bash
# cmd_extractor  process/grounding/global_weight_table
# {"dependencies_":["process/grounding/factor/inf_istrue_entity_formation/materialize","process/grounding/factor/inf_istrue_entity_location/materialize","process/grounding/factor/inf_istrue_entity_taxon/materialize","process/grounding/factor/inf_istrue_entity_temporal/materialize","process/grounding/factor/inf_istrue_relation_formation/materialize","process/grounding/factor/inf_istrue_relation_formation_global/materialize","process/grounding/factor/inf_istrue_relation_formationtemporal/materialize","process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize","process/grounding/factor/inf_istrue_relation_taxonomy/materialize","process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize"],"style":"cmd_extractor","cmd":"\n        : ${DEEPDIVE_GROUNDING_DIR:=\"$DEEPDIVE_APP\"/run/model/grounding}\n\n        # set up a union view for all weight tables (\"dd_graph_weights\")\n        deepdive create view 'dd_graph_weights' as '(SELECT \"id\"\n     , \"isfixed\"\n     , \"initvalue\"\n     , '\\''inf_istrue_entity_formation-'\\'' ||'\\''-'\\''|| CASE WHEN \"dd_weight_column_0\" IS NULL THEN '\\'''\\''\n              ELSE \"dd_weight_column_0\" || '\\'''\\''  -- XXX CAST(... AS TEXT) unsupported by MySQL\n          END AS \"description\"\n     , NULL AS \"categories\"\nFROM \"dd_weights_inf_istrue_entity_formation\")\nUNION ALL\n(SELECT \"id\"\n     , \"isfixed\"\n     , \"initvalue\"\n     , '\\''inf_istrue_entity_location-'\\'' ||'\\''-'\\''|| CASE WHEN \"dd_weight_column_0\" IS NULL THEN '\\'''\\''\n              ELSE \"dd_weight_column_0\" || '\\'''\\''  -- XXX CAST(... AS TEXT) unsupported by MySQL\n          END AS \"description\"\n     , NULL AS \"categories\"\nFROM \"dd_weights_inf_istrue_entity_location\")\nUNION ALL\n(SELECT \"id\"\n     , \"isfixed\"\n     , \"initvalue\"\n     , '\\''inf_istrue_entity_taxon-'\\'' ||'\\''-'\\''|| CASE WHEN \"dd_weight_column_0\" IS NULL THEN '\\'''\\''\n              ELSE \"dd_weight_column_0\" || '\\'''\\''  -- XXX CAST(... AS TEXT) unsupported by MySQL\n          END AS \"description\"\n     , NULL AS \"categories\"\nFROM \"dd_weights_inf_istrue_entity_taxon\")\nUNION ALL\n(SELECT \"id\"\n     , \"isfixed\"\n     , \"initvalue\"\n     , '\\''inf_istrue_entity_temporal-'\\'' ||'\\''-'\\''|| CASE WHEN \"dd_weight_column_0\" IS NULL THEN '\\'''\\''\n              ELSE \"dd_weight_column_0\" || '\\'''\\''  -- XXX CAST(... AS TEXT) unsupported by MySQL\n          END AS \"description\"\n     , NULL AS \"categories\"\nFROM \"dd_weights_inf_istrue_entity_temporal\")\nUNION ALL\n(SELECT \"id\"\n     , \"isfixed\"\n     , \"initvalue\"\n     , '\\''inf_istrue_relation_formation-'\\'' ||'\\''-'\\''|| CASE WHEN \"dd_weight_column_0\" IS NULL THEN '\\'''\\''\n              ELSE \"dd_weight_column_0\" || '\\'''\\''  -- XXX CAST(... AS TEXT) unsupported by MySQL\n          END AS \"description\"\n     , NULL AS \"categories\"\nFROM \"dd_weights_inf_istrue_relation_formation\")\nUNION ALL\n(SELECT \"id\"\n     , \"isfixed\"\n     , \"initvalue\"\n     , '\\''inf_istrue_relation_formation_global-'\\'' ||'\\''-'\\''|| CASE WHEN \"dd_weight_column_0\" IS NULL THEN '\\'''\\''\n              ELSE \"dd_weight_column_0\" || '\\'''\\''  -- XXX CAST(... AS TEXT) unsupported by MySQL\n          END AS \"description\"\n     , NULL AS \"categories\"\nFROM \"dd_weights_inf_istrue_relation_formation_global\")\nUNION ALL\n(SELECT \"id\"\n     , \"isfixed\"\n     , \"initvalue\"\n     , '\\''inf_istrue_relation_formationtemporal-'\\'' ||'\\''-'\\''|| CASE WHEN \"dd_weight_column_0\" IS NULL THEN '\\'''\\''\n              ELSE \"dd_weight_column_0\" || '\\'''\\''  -- XXX CAST(... AS TEXT) unsupported by MySQL\n          END AS \"description\"\n     , NULL AS \"categories\"\nFROM \"dd_weights_inf_istrue_relation_formationtemporal\")\nUNION ALL\n(SELECT \"id\"\n     , \"isfixed\"\n     , \"initvalue\"\n     , '\\''inf_istrue_relation_formationtemporal_global-'\\'' ||'\\''-'\\''|| CASE WHEN \"dd_weight_column_0\" IS NULL THEN '\\'''\\''\n              ELSE \"dd_weight_column_0\" || '\\'''\\''  -- XXX CAST(... AS TEXT) unsupported by MySQL\n          END AS \"description\"\n     , NULL AS \"categories\"\nFROM \"dd_weights_inf_istrue_relation_formationtemporal_global\")\nUNION ALL\n(SELECT \"id\"\n     , \"isfixed\"\n     , \"initvalue\"\n     , '\\''inf_istrue_relation_taxonomy-'\\'' ||'\\''-'\\''|| CASE WHEN \"dd_weight_column_0\" IS NULL THEN '\\'''\\''\n              ELSE \"dd_weight_column_0\" || '\\'''\\''  -- XXX CAST(... AS TEXT) unsupported by MySQL\n          END AS \"description\"\n     , NULL AS \"categories\"\nFROM \"dd_weights_inf_istrue_relation_taxonomy\")\nUNION ALL\n(SELECT \"id\"\n     , \"isfixed\"\n     , \"initvalue\"\n     , '\\''inf_istrue_relation_taxonomy_global-'\\'' ||'\\''-'\\''|| CASE WHEN \"dd_weight_column_0\" IS NULL THEN '\\'''\\''\n              ELSE \"dd_weight_column_0\" || '\\'''\\''  -- XXX CAST(... AS TEXT) unsupported by MySQL\n          END AS \"description\"\n     , NULL AS \"categories\"\nFROM \"dd_weights_inf_istrue_relation_taxonomy_global\")'\n        ","name":"process/grounding/global_weight_table"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/grounding/global_weight_table'

        : ${DEEPDIVE_GROUNDING_DIR:="$DEEPDIVE_APP"/run/model/grounding}

        # set up a union view for all weight tables ("dd_graph_weights")
        deepdive create view 'dd_graph_weights' as '(SELECT "id"
     , "isfixed"
     , "initvalue"
     , '\''inf_istrue_entity_formation-'\'' ||'\''-'\''|| CASE WHEN "dd_weight_column_0" IS NULL THEN '\'''\''
              ELSE "dd_weight_column_0" || '\'''\''  -- XXX CAST(... AS TEXT) unsupported by MySQL
          END AS "description"
     , NULL AS "categories"
FROM "dd_weights_inf_istrue_entity_formation")
UNION ALL
(SELECT "id"
     , "isfixed"
     , "initvalue"
     , '\''inf_istrue_entity_location-'\'' ||'\''-'\''|| CASE WHEN "dd_weight_column_0" IS NULL THEN '\'''\''
              ELSE "dd_weight_column_0" || '\'''\''  -- XXX CAST(... AS TEXT) unsupported by MySQL
          END AS "description"
     , NULL AS "categories"
FROM "dd_weights_inf_istrue_entity_location")
UNION ALL
(SELECT "id"
     , "isfixed"
     , "initvalue"
     , '\''inf_istrue_entity_taxon-'\'' ||'\''-'\''|| CASE WHEN "dd_weight_column_0" IS NULL THEN '\'''\''
              ELSE "dd_weight_column_0" || '\'''\''  -- XXX CAST(... AS TEXT) unsupported by MySQL
          END AS "description"
     , NULL AS "categories"
FROM "dd_weights_inf_istrue_entity_taxon")
UNION ALL
(SELECT "id"
     , "isfixed"
     , "initvalue"
     , '\''inf_istrue_entity_temporal-'\'' ||'\''-'\''|| CASE WHEN "dd_weight_column_0" IS NULL THEN '\'''\''
              ELSE "dd_weight_column_0" || '\'''\''  -- XXX CAST(... AS TEXT) unsupported by MySQL
          END AS "description"
     , NULL AS "categories"
FROM "dd_weights_inf_istrue_entity_temporal")
UNION ALL
(SELECT "id"
     , "isfixed"
     , "initvalue"
     , '\''inf_istrue_relation_formation-'\'' ||'\''-'\''|| CASE WHEN "dd_weight_column_0" IS NULL THEN '\'''\''
              ELSE "dd_weight_column_0" || '\'''\''  -- XXX CAST(... AS TEXT) unsupported by MySQL
          END AS "description"
     , NULL AS "categories"
FROM "dd_weights_inf_istrue_relation_formation")
UNION ALL
(SELECT "id"
     , "isfixed"
     , "initvalue"
     , '\''inf_istrue_relation_formation_global-'\'' ||'\''-'\''|| CASE WHEN "dd_weight_column_0" IS NULL THEN '\'''\''
              ELSE "dd_weight_column_0" || '\'''\''  -- XXX CAST(... AS TEXT) unsupported by MySQL
          END AS "description"
     , NULL AS "categories"
FROM "dd_weights_inf_istrue_relation_formation_global")
UNION ALL
(SELECT "id"
     , "isfixed"
     , "initvalue"
     , '\''inf_istrue_relation_formationtemporal-'\'' ||'\''-'\''|| CASE WHEN "dd_weight_column_0" IS NULL THEN '\'''\''
              ELSE "dd_weight_column_0" || '\'''\''  -- XXX CAST(... AS TEXT) unsupported by MySQL
          END AS "description"
     , NULL AS "categories"
FROM "dd_weights_inf_istrue_relation_formationtemporal")
UNION ALL
(SELECT "id"
     , "isfixed"
     , "initvalue"
     , '\''inf_istrue_relation_formationtemporal_global-'\'' ||'\''-'\''|| CASE WHEN "dd_weight_column_0" IS NULL THEN '\'''\''
              ELSE "dd_weight_column_0" || '\'''\''  -- XXX CAST(... AS TEXT) unsupported by MySQL
          END AS "description"
     , NULL AS "categories"
FROM "dd_weights_inf_istrue_relation_formationtemporal_global")
UNION ALL
(SELECT "id"
     , "isfixed"
     , "initvalue"
     , '\''inf_istrue_relation_taxonomy-'\'' ||'\''-'\''|| CASE WHEN "dd_weight_column_0" IS NULL THEN '\'''\''
              ELSE "dd_weight_column_0" || '\'''\''  -- XXX CAST(... AS TEXT) unsupported by MySQL
          END AS "description"
     , NULL AS "categories"
FROM "dd_weights_inf_istrue_relation_taxonomy")
UNION ALL
(SELECT "id"
     , "isfixed"
     , "initvalue"
     , '\''inf_istrue_relation_taxonomy_global-'\'' ||'\''-'\''|| CASE WHEN "dd_weight_column_0" IS NULL THEN '\'''\''
              ELSE "dd_weight_column_0" || '\'''\''  -- XXX CAST(... AS TEXT) unsupported by MySQL
          END AS "description"
     , NULL AS "categories"
FROM "dd_weights_inf_istrue_relation_taxonomy_global")'
        



