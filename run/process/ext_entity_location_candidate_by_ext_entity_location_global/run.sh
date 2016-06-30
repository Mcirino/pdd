#!/usr/bin/env bash
# tsv_extractor  process/ext_entity_location_candidate_by_ext_entity_location_global
# {"dependencies":["ext_documents_serialized"],"input":" SELECT R0.docid AS \"documents_serialized.R0.docid\", R0.sentids AS \"documents_serialized.R0.sentids\", R0.wordidxs AS \"documents_serialized.R0.wordidxs\", R0.words AS \"documents_serialized.R0.words\", R0.poses AS \"documents_serialized.R0.poses\", R0.ners AS \"documents_serialized.R0.ners\", R0.lemmas AS \"documents_serialized.R0.lemmas\", R0.dep_paths AS \"documents_serialized.R0.dep_paths\", R0.dep_parents AS \"documents_serialized.R0.dep_parents\", R0.font AS \"documents_serialized.R0.font\", R0.layout AS \"documents_serialized.R0.layout\"\nFROM documents_serialized R0\n        \n          ","input_batch_size":"100000","input_relations":["documents_serialized"],"output_relation":"entity_location_candidate","parallelism":"1","style":"tsv_extractor","udf":"\"$DEEPDIVE_APP\"//udf/ext_location_global.py","dependencies_":["process/ext_documents_serialized"],"input_":["data/documents_serialized"],"output_":"data/entity_location_candidate","name":"process/ext_entity_location_candidate_by_ext_entity_location_global"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_entity_location_candidate_by_ext_entity_location_global'
export DEEPDIVE_LOAD_FORMAT=tsv

deepdive compute execute \
    input_sql=' SELECT R0.docid AS "documents_serialized.R0.docid", R0.sentids AS "documents_serialized.R0.sentids", R0.wordidxs AS "documents_serialized.R0.wordidxs", R0.words AS "documents_serialized.R0.words", R0.poses AS "documents_serialized.R0.poses", R0.ners AS "documents_serialized.R0.ners", R0.lemmas AS "documents_serialized.R0.lemmas", R0.dep_paths AS "documents_serialized.R0.dep_paths", R0.dep_parents AS "documents_serialized.R0.dep_parents", R0.font AS "documents_serialized.R0.font", R0.layout AS "documents_serialized.R0.layout"
FROM documents_serialized R0
        
          ' \
    command='"$DEEPDIVE_APP"//udf/ext_location_global.py' \
    output_relation='entity_location_candidate' \
    #



