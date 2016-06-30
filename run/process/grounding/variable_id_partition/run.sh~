#!/usr/bin/env bash
# cmd_extractor  process/grounding/variable_id_partition
# {"dependencies_":["data/entity_formation","data/entity_location","data/entity_taxon","data/entity_temporal","data/relation_formation","data/relation_formation_global","data/relation_formationtemporal","data/relation_formationtemporal_global","data/relation_taxonomy","data/relation_taxonomy_global"],"style":"cmd_extractor","cmd":"\n        : ${DEEPDIVE_GROUNDING_DIR:=\"$DEEPDIVE_APP\"/run/model/grounding}\n\n        RANGE_BEGIN=0 \\\n        partition_id_range 'entity_formation' 'entity_location' 'entity_taxon' 'entity_temporal' 'relation_formation' 'relation_formation_global' 'relation_formationtemporal' 'relation_formationtemporal_global' 'relation_taxonomy' 'relation_taxonomy_global' | {\n            # record the base\n            variableCountTotal=0\n            while read table begin excludeEnd; do\n                varPath=\"$DEEPDIVE_GROUNDING_DIR\"/variable/${table}\n                mkdir -p \"$varPath\"\n                cd \"$varPath\"\n                echo $begin                      >id_begin\n                echo $excludeEnd                 >id_exclude_end\n                echo $(( $excludeEnd - $begin )) >count\n                variableCountTotal=$excludeEnd\n            done\n            # record the final count\n            echo $variableCountTotal >\"$DEEPDIVE_GROUNDING_DIR\"/variable_count\n        }\n        ","name":"process/grounding/variable_id_partition"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/grounding/variable_id_partition'

        : ${DEEPDIVE_GROUNDING_DIR:="$DEEPDIVE_APP"/run/model/grounding}

        RANGE_BEGIN=0 \
        partition_id_range 'entity_formation' 'entity_location' 'entity_taxon' 'entity_temporal' 'relation_formation' 'relation_formation_global' 'relation_formationtemporal' 'relation_formationtemporal_global' 'relation_taxonomy' 'relation_taxonomy_global' | {
            # record the base
            variableCountTotal=0
            while read table begin excludeEnd; do
                varPath="$DEEPDIVE_GROUNDING_DIR"/variable/${table}
                mkdir -p "$varPath"
                cd "$varPath"
                echo $begin                      >id_begin
                echo $excludeEnd                 >id_exclude_end
                echo $(( $excludeEnd - $begin )) >count
                variableCountTotal=$excludeEnd
            done
            # record the final count
            echo $variableCountTotal >"$DEEPDIVE_GROUNDING_DIR"/variable_count
        }
        



