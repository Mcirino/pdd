#!/usr/bin/env bash
# cmd_extractor  process/grounding/weight_id_partition
# {"dependencies_":["process/grounding/factor/inf_istrue_entity_formation/materialize","process/grounding/factor/inf_istrue_entity_location/materialize","process/grounding/factor/inf_istrue_entity_taxon/materialize","process/grounding/factor/inf_istrue_entity_temporal/materialize","process/grounding/factor/inf_istrue_relation_formation/materialize","process/grounding/factor/inf_istrue_relation_formation_global/materialize","process/grounding/factor/inf_istrue_relation_formationtemporal/materialize","process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize","process/grounding/factor/inf_istrue_relation_taxonomy/materialize","process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize"],"style":"cmd_extractor","cmd":"\n        : ${DEEPDIVE_GROUNDING_DIR:=\"$DEEPDIVE_APP\"/run/model/grounding}\n\n        # partition the id range for weights\n        RANGE_BEGIN=0 RANGE_STEP=1 \\\n        partition_id_range 'dd_weights_inf_istrue_entity_formation' 'dd_weights_inf_istrue_entity_location' 'dd_weights_inf_istrue_entity_taxon' 'dd_weights_inf_istrue_entity_temporal' 'dd_weights_inf_istrue_relation_formation' 'dd_weights_inf_istrue_relation_formation_global' 'dd_weights_inf_istrue_relation_formationtemporal' 'dd_weights_inf_istrue_relation_formationtemporal_global' 'dd_weights_inf_istrue_relation_taxonomy' 'dd_weights_inf_istrue_relation_taxonomy_global' | {\n            weightsCountTotal=0\n            while read table begin excludeEnd; do\n                factor=${table#'dd_weights_'}\n                facPath=\"$DEEPDIVE_GROUNDING_DIR\"/factor/${factor}\n                mkdir -p \"$facPath\"\n                cd \"$facPath\"\n                echo $begin                      >weights_id_begin\n                echo $excludeEnd                 >weights_id_exclude_end\n                echo $(( $excludeEnd - $begin )) >weights_count\n                weightsCountTotal=$excludeEnd\n            done\n            echo $weightsCountTotal >\"$DEEPDIVE_GROUNDING_DIR\"/factor/weights_count\n        }\n        ","name":"process/grounding/weight_id_partition"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/grounding/weight_id_partition'

        : ${DEEPDIVE_GROUNDING_DIR:="$DEEPDIVE_APP"/run/model/grounding}

        # partition the id range for weights
        RANGE_BEGIN=0 RANGE_STEP=1 \
        partition_id_range 'dd_weights_inf_istrue_entity_formation' 'dd_weights_inf_istrue_entity_location' 'dd_weights_inf_istrue_entity_taxon' 'dd_weights_inf_istrue_entity_temporal' 'dd_weights_inf_istrue_relation_formation' 'dd_weights_inf_istrue_relation_formation_global' 'dd_weights_inf_istrue_relation_formationtemporal' 'dd_weights_inf_istrue_relation_formationtemporal_global' 'dd_weights_inf_istrue_relation_taxonomy' 'dd_weights_inf_istrue_relation_taxonomy_global' | {
            weightsCountTotal=0
            while read table begin excludeEnd; do
                factor=${table#'dd_weights_'}
                facPath="$DEEPDIVE_GROUNDING_DIR"/factor/${factor}
                mkdir -p "$facPath"
                cd "$facPath"
                echo $begin                      >weights_id_begin
                echo $excludeEnd                 >weights_id_exclude_end
                echo $(( $excludeEnd - $begin )) >weights_count
                weightsCountTotal=$excludeEnd
            done
            echo $weightsCountTotal >"$DEEPDIVE_GROUNDING_DIR"/factor/weights_count
        }
        



