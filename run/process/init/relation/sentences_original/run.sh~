#!/usr/bin/env bash
# cmd_extractor  process/init/relation/sentences_original
# {"style":"cmd_extractor","cmd":"deepdive create table 'sentences_original' && deepdive load 'sentences_original'","dependencies_":["process/init/app"],"output_relation":"sentences_original","output_":"data/sentences_original","name":"process/init/relation/sentences_original"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/init/relation/sentences_original'
deepdive create table 'sentences_original' && deepdive load 'sentences_original'



