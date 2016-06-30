# on DN0a222566.SUNet: deepdive do sentences
# run/20160630/105348.758425000/plan.sh
# execution plan for data/sentences

: ## process/init/app ##########################################################
: # Done: 2016-06-30T09:53:31-0700 (1h 17s ago)
: process/init/app/run.sh
: mark_done process/init/app
: ##############################################################################

: ## process/init/relation/sentences_original ##################################
: # Done: 2016-06-30T09:53:38-0700 (1h 10s ago)
: process/init/relation/sentences_original/run.sh
: mark_done process/init/relation/sentences_original
: ##############################################################################

: ## data/sentences_original ###################################################
: # Done: 2016-06-30T09:53:38-0700 (1h 11s ago)
: # no-op
: mark_done data/sentences_original
: ##############################################################################

## process/ext_sentences #####################################################
: # Done: 2016-06-30T09:53:41-0700 (1h 8s ago)
# Done: 2016-06-30T09:53:41-0700 (1h 7s ago)
process/ext_sentences/run.sh
mark_done process/ext_sentences
##############################################################################

## data/sentences ############################################################
: # Done: 2016-06-30T09:53:41-0700 (1h 8s ago)
# Done: 2016-06-30T09:53:41-0700 (1h 7s ago)
# no-op
mark_done data/sentences
##############################################################################

