# on DN0a222566.SUNet: deepdive do documents
# run/20160630/100832.602723000/plan.sh
# execution plan for data/documents

: ## process/init/app ##########################################################
: # Done: 2016-06-30T09:53:31-0700 (15m 1s ago)
: process/init/app/run.sh
: mark_done process/init/app
: ##############################################################################

: ## process/init/relation/sentences_original ##################################
: # Done: 2016-06-30T09:53:38-0700 (14m 54s ago)
: process/init/relation/sentences_original/run.sh
: mark_done process/init/relation/sentences_original
: ##############################################################################

: ## data/sentences_original ###################################################
: # Done: 2016-06-30T09:53:38-0700 (14m 54s ago)
: # no-op
: mark_done data/sentences_original
: ##############################################################################

: ## process/ext_sentences #####################################################
: # Done: 2016-06-30T09:53:41-0700 (14m 51s ago)
: process/ext_sentences/run.sh
: mark_done process/ext_sentences
: ##############################################################################

: ## data/sentences ############################################################
: # Done: 2016-06-30T09:53:41-0700 (14m 51s ago)
: # no-op
: mark_done data/sentences
: ##############################################################################

## process/ext_sentences_serialized ##########################################
# Done: N/A
process/ext_sentences_serialized/run.sh
mark_done process/ext_sentences_serialized
##############################################################################

## data/sentences_serialized #################################################
# Done: N/A
# no-op
mark_done data/sentences_serialized
##############################################################################

## process/ext_documents #####################################################
# Done: N/A
process/ext_documents/run.sh
mark_done process/ext_documents
##############################################################################

## data/documents ############################################################
# Done: N/A
# no-op
mark_done data/documents
##############################################################################

