#!/usr/bin/env bash
# cmd_extractor  process/ext_sentences
# {"cmd":"\n\n\t# TODO use temporary table\n\tdeepdive create table \"sentences\"\n\tdeepdive sql 'INSERT INTO sentences SELECT R0.docid AS \"sentences_original.R0.docid\", R0.sentid AS \"sentences_original.R0.sentid\", R0.wordindex AS \"sentences_original.R0.wordindex\", R0.words AS \"sentences_original.R0.words\", R0.poses AS \"sentences_original.R0.poses\", R0.ners AS \"sentences_original.R0.ners\", R0.lemmas AS \"sentences_original.R0.lemmas\", R0.dep_paths AS \"sentences_original.R0.dep_paths\", R0.dep_parents AS \"sentences_original.R0.dep_parents\", NULL AS column_9, NULL AS column_9\nFROM sentences_original R0\n        '\n\t# TODO rename temporary table to replace output_relation\n\t\n        ","input_relations":["sentences_original"],"output_relation":"sentences","style":"cmd_extractor","dependencies_":[],"input_":["data/sentences_original"],"output_":"data/sentences","name":"process/ext_sentences"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/ext_sentences'


	# TODO use temporary table
	deepdive create table "sentences"
	deepdive sql 'INSERT INTO sentences SELECT R0.docid AS "sentences_original.R0.docid", R0.sentid AS "sentences_original.R0.sentid", R0.wordindex AS "sentences_original.R0.wordindex", R0.words AS "sentences_original.R0.words", R0.poses AS "sentences_original.R0.poses", R0.ners AS "sentences_original.R0.ners", R0.lemmas AS "sentences_original.R0.lemmas", R0.dep_paths AS "sentences_original.R0.dep_paths", R0.dep_parents AS "sentences_original.R0.dep_parents", NULL AS column_9, NULL AS column_9
FROM sentences_original R0
        '
	# TODO rename temporary table to replace output_relation
	
        



