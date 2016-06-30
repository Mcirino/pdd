#!/usr/bin/env bash
# tsv_extractor  process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy
# {"dependencies":["ext_relation_candidates_by_ext_relation_same_sent"],"input":" SELECT R0.docid AS \"relation_candidates.R0.docid\", R0.type AS \"relation_candidates.R0.type\", R0.eid1 AS \"relation_candidates.R0.eid1\", R0.eid2 AS \"relation_candidates.R0.eid2\", R0.entity1 AS \"relation_candidates.R0.entity1\", R0.entity2 AS \"relation_candidates.R0.entity2\", R0.features AS \"relation_candidates.R0.features\"\nFROM relation_candidates R0\n        \n          ","input_batch_size":"100000","input_relations":["relation_candidates"],"output_relation":"relation_taxonomy_supervise","parallelism":"1","style":"tsv_extractor","udf":"\"$DEEPDIVE_APP\"//udf/supervise_taxonomy.py","dependencies_":["process/ext_relation_candidates_by_ext_relation_same_sent"],"input_":["data/relation_candidates"],"output_":"data/relation_taxonomy_supervise","name":"process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy'
export DEEPDIVE_LOAD_FORMAT=tsv

deepdive compute execute \
    input_sql=' SELECT R0.docid AS "relation_candidates.R0.docid", R0.type AS "relation_candidates.R0.type", R0.eid1 AS "relation_candidates.R0.eid1", R0.eid2 AS "relation_candidates.R0.eid2", R0.entity1 AS "relation_candidates.R0.entity1", R0.entity2 AS "relation_candidates.R0.entity2", R0.features AS "relation_candidates.R0.features"
FROM relation_candidates R0
        
          ' \
    command='"$DEEPDIVE_APP"//udf/supervise_taxonomy.py' \
    output_relation='relation_taxonomy_supervise' \
    #



