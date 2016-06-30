#!/usr/bin/env bash
# cmd_extractor  process/ext_documents_serialized
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"documents_serialized\"\n\tdeepdive sql 'INSERT INTO documents_serialized SELECT R0.docid AS \"documents.R0.docid\", array_to_string(R0.sentids, '\\''|||||'\\'') AS column_1, array_to_string(R0.wordidxs, '\\''|||||'\\'') AS column_2, array_to_string(R0.words, '\\''|||||'\\'') AS column_3, array_to_string(R0.poses, '\\''|||||'\\'') AS column_4, array_to_string(R0.ners, '\\''|||||'\\'') AS column_5, array_to_string(R0.lemmas, '\\''|||||'\\'') AS column_6, array_to_string(R0.dep_paths, '\\''|||||'\\'') AS column_7, array_to_string(R0.dep_parents, '\\''|||||'\\'') AS column_8, array_to_string(R0.font, '\\''|||||'\\'') AS column_9, array_to_string(R0.layout, '\\''|||||'\\'') AS column_10\nFROM documents R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_documents"],"input_relations":["documents"],"output_relation":"documents_serialized","style":"cmd_extractor","dependencies_":["process/ext_documents"],"input_":["data/documents"],"output_":"data/documents_serialized","name":"process/ext_documents_serialized"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_documents_serialized'


	# TODO use temporary table
	deepdive create table "documents_serialized"
	deepdive sql 'INSERT INTO documents_serialized SELECT R0.docid AS "documents.R0.docid", array_to_string(R0.sentids, '\''|||||'\'') AS column_1, array_to_string(R0.wordidxs, '\''|||||'\'') AS column_2, array_to_string(R0.words, '\''|||||'\'') AS column_3, array_to_string(R0.poses, '\''|||||'\'') AS column_4, array_to_string(R0.ners, '\''|||||'\'') AS column_5, array_to_string(R0.lemmas, '\''|||||'\'') AS column_6, array_to_string(R0.dep_paths, '\''|||||'\'') AS column_7, array_to_string(R0.dep_parents, '\''|||||'\'') AS column_8, array_to_string(R0.font, '\''|||||'\'') AS column_9, array_to_string(R0.layout, '\''|||||'\'') AS column_10
FROM documents R0
        '
	# TODO rename temporary table to replace output_relation
	
        



