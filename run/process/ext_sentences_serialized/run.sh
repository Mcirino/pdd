#!/usr/bin/env bash
# cmd_extractor  process/ext_sentences_serialized
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"sentences_serialized\"\n\tdeepdive sql 'INSERT INTO sentences_serialized SELECT DISTINCT R0.docid AS \"sentences.R0.docid\", R0.sentid AS \"sentences.R0.sentid\", array_to_string(R0.wordindex, '\\''@@@@@'\\'') AS column_2, array_to_string(R0.words, '\\''@@@@@'\\'') AS column_3, array_to_string(R0.poses, '\\''@@@@@'\\'') AS column_4, array_to_string(R0.ners, '\\''@@@@@'\\'') AS column_5, array_to_string(R0.lemmas, '\\''@@@@@'\\'') AS column_6, array_to_string(R0.dep_paths, '\\''@@@@@'\\'') AS column_7, array_to_string(R0.dep_parents, '\\''@@@@@'\\'') AS column_8, array_to_string(R0.font, '\\''@@@@@'\\'') AS column_9, array_to_string(R0.layout, '\\''@@@@@'\\'') AS column_10\nFROM sentences R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","dependencies":["ext_sentences"],"input_relations":["sentences"],"output_relation":"sentences_serialized","style":"cmd_extractor","dependencies_":["process/ext_sentences"],"input_":["data/sentences"],"output_":"data/sentences_serialized","name":"process/ext_sentences_serialized"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_sentences_serialized'


	# TODO use temporary table
	deepdive create table "sentences_serialized"
	deepdive sql 'INSERT INTO sentences_serialized SELECT DISTINCT R0.docid AS "sentences.R0.docid", R0.sentid AS "sentences.R0.sentid", array_to_string(R0.wordindex, '\''@@@@@'\'') AS column_2, array_to_string(R0.words, '\''@@@@@'\'') AS column_3, array_to_string(R0.poses, '\''@@@@@'\'') AS column_4, array_to_string(R0.ners, '\''@@@@@'\'') AS column_5, array_to_string(R0.lemmas, '\''@@@@@'\'') AS column_6, array_to_string(R0.dep_paths, '\''@@@@@'\'') AS column_7, array_to_string(R0.dep_parents, '\''@@@@@'\'') AS column_8, array_to_string(R0.font, '\''@@@@@'\'') AS column_9, array_to_string(R0.layout, '\''@@@@@'\'') AS column_10
FROM sentences R0
        '
	# TODO rename temporary table to replace output_relation
	
        



