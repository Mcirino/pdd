#!/usr/bin/env bash
# tsv_extractor  process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global
# {"dependencies":["ext_document_with_taxon_entities"],"input":" SELECT R0.docid AS \"document_with_taxon_entities.R0.docid\", R0.entities AS \"document_with_taxon_entities.R0.entities\", R0.types AS \"document_with_taxon_entities.R0.types\", R0.sentids AS \"document_with_taxon_entities.R0.sentids\", R0.wordidxs AS \"document_with_taxon_entities.R0.wordidxs\", R0.words AS \"document_with_taxon_entities.R0.words\", R0.poses AS \"document_with_taxon_entities.R0.poses\", R0.ners AS \"document_with_taxon_entities.R0.ners\", R0.lemmas AS \"document_with_taxon_entities.R0.lemmas\", R0.dep_paths AS \"document_with_taxon_entities.R0.dep_paths\", R0.dep_parents AS \"document_with_taxon_entities.R0.dep_parents\", R0.font AS \"document_with_taxon_entities.R0.font\", R0.layout AS \"document_with_taxon_entities.R0.layout\"\nFROM document_with_taxon_entities R0\n        \n          ","input_batch_size":"100000","input_relations":["document_with_taxon_entities"],"output_relation":"entity_taxon_candidate__0","parallelism":"1","style":"tsv_extractor","udf":"\"$DEEPDIVE_APP\"//udf/ext_taxon_global.py","dependencies_":["process/ext_document_with_taxon_entities"],"input_":["data/document_with_taxon_entities"],"output_":"data/entity_taxon_candidate__0","name":"process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global'
export DEEPDIVE_LOAD_FORMAT=tsv

deepdive compute execute \
    input_sql=' SELECT R0.docid AS "document_with_taxon_entities.R0.docid", R0.entities AS "document_with_taxon_entities.R0.entities", R0.types AS "document_with_taxon_entities.R0.types", R0.sentids AS "document_with_taxon_entities.R0.sentids", R0.wordidxs AS "document_with_taxon_entities.R0.wordidxs", R0.words AS "document_with_taxon_entities.R0.words", R0.poses AS "document_with_taxon_entities.R0.poses", R0.ners AS "document_with_taxon_entities.R0.ners", R0.lemmas AS "document_with_taxon_entities.R0.lemmas", R0.dep_paths AS "document_with_taxon_entities.R0.dep_paths", R0.dep_parents AS "document_with_taxon_entities.R0.dep_parents", R0.font AS "document_with_taxon_entities.R0.font", R0.layout AS "document_with_taxon_entities.R0.layout"
FROM document_with_taxon_entities R0
        
          ' \
    command='"$DEEPDIVE_APP"//udf/ext_taxon_global.py' \
    output_relation='entity_taxon_candidate__0' \
    #



