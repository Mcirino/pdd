#!/usr/bin/env bash
# tsv_extractor  process/ext_entity_formation_candidate_local_by_ext_entity_formation_local
# {"dependencies":["ext_sentences_serialized"],"input":" SELECT R0.docid AS \"sentences_serialized.R0.docid\", R0.sentid AS \"sentences_serialized.R0.sentid\", R0.wordidxs AS \"sentences_serialized.R0.wordidxs\", R0.words AS \"sentences_serialized.R0.words\", R0.poses AS \"sentences_serialized.R0.poses\", R0.ners AS \"sentences_serialized.R0.ners\", R0.lemmas AS \"sentences_serialized.R0.lemmas\", R0.dep_paths AS \"sentences_serialized.R0.dep_paths\", R0.dep_parents AS \"sentences_serialized.R0.dep_parents\", R0.font AS \"sentences_serialized.R0.font\", R0.layout AS \"sentences_serialized.R0.layout\"\nFROM sentences_serialized R0\n        \n          ","input_batch_size":"100000","input_relations":["sentences_serialized"],"output_relation":"entity_formation_candidate_local","parallelism":"1","style":"tsv_extractor","udf":"\"$DEEPDIVE_APP\"//udf/ext_formation_local.py","dependencies_":["process/ext_sentences_serialized"],"input_":["data/sentences_serialized"],"output_":"data/entity_formation_candidate_local","name":"process/ext_entity_formation_candidate_local_by_ext_entity_formation_local"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_entity_formation_candidate_local_by_ext_entity_formation_local'
export DEEPDIVE_LOAD_FORMAT=tsv

deepdive compute execute \
    input_sql=' SELECT R0.docid AS "sentences_serialized.R0.docid", R0.sentid AS "sentences_serialized.R0.sentid", R0.wordidxs AS "sentences_serialized.R0.wordidxs", R0.words AS "sentences_serialized.R0.words", R0.poses AS "sentences_serialized.R0.poses", R0.ners AS "sentences_serialized.R0.ners", R0.lemmas AS "sentences_serialized.R0.lemmas", R0.dep_paths AS "sentences_serialized.R0.dep_paths", R0.dep_parents AS "sentences_serialized.R0.dep_parents", R0.font AS "sentences_serialized.R0.font", R0.layout AS "sentences_serialized.R0.layout"
FROM sentences_serialized R0
        
          ' \
    command='"$DEEPDIVE_APP"//udf/ext_formation_local.py' \
    output_relation='entity_formation_candidate_local' \
    #



