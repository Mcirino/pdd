#!/usr/bin/env bash
# cmd_extractor  process/ext_documents
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"documents\"\n\tdeepdive sql 'INSERT INTO documents SELECT DISTINCT R0.docid AS \"sentences_serialized.R0.docid\", ARRAY_AGG(R0.sentid) AS column_1, ARRAY_AGG(R0.wordidxs) AS column_2, ARRAY_AGG(R0.words) AS column_3, ARRAY_AGG(R0.poses) AS column_4, ARRAY_AGG(R0.ners) AS column_5, ARRAY_AGG(R0.lemmas) AS column_6, ARRAY_AGG(R0.dep_paths) AS column_7, ARRAY_AGG(R0.dep_parents) AS column_8, ARRAY_AGG(R0.font) AS column_9, ARRAY_AGG(R0.layout) AS column_10\nFROM sentences_serialized R0\n        \n        GROUP BY R0.docid'\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_sentences_serialized"],"input_relations":["sentences_serialized"],"output_relation":"documents","style":"cmd_extractor","dependencies_":["process/ext_sentences_serialized"],"input_":["data/sentences_serialized"],"output_":"data/documents","name":"process/ext_documents"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_documents'


	# TODO use temporary table
	deepdive create table "documents"
	deepdive sql 'INSERT INTO documents SELECT DISTINCT R0.docid AS "sentences_serialized.R0.docid", ARRAY_AGG(R0.sentid) AS column_1, ARRAY_AGG(R0.wordidxs) AS column_2, ARRAY_AGG(R0.words) AS column_3, ARRAY_AGG(R0.poses) AS column_4, ARRAY_AGG(R0.ners) AS column_5, ARRAY_AGG(R0.lemmas) AS column_6, ARRAY_AGG(R0.dep_paths) AS column_7, ARRAY_AGG(R0.dep_parents) AS column_8, ARRAY_AGG(R0.font) AS column_9, ARRAY_AGG(R0.layout) AS column_10
FROM sentences_serialized R0
        
        GROUP BY R0.docid'
	# TODO rename temporary table to replace output_relation
	
        



