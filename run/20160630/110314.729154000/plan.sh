# on DN0a222566.SUNet: deepdive do taxon_per_doc
# run/20160630/110314.729154000/plan.sh
# execution plan for data/taxon_per_doc

: ## process/init/app ##########################################################
: # Done: 2016-06-30T09:53:31-0700 (1h 9m 43s ago)
: process/init/app/run.sh
: mark_done process/init/app
: ##############################################################################

: ## process/init/relation/sentences_original ##################################
: # Done: 2016-06-30T09:53:38-0700 (1h 9m 36s ago)
: process/init/relation/sentences_original/run.sh
: mark_done process/init/relation/sentences_original
: ##############################################################################

: ## data/sentences_original ###################################################
: # Done: 2016-06-30T09:53:38-0700 (1h 9m 37s ago)
: # no-op
: mark_done data/sentences_original
: ##############################################################################

: ## process/ext_sentences #####################################################
: # Done: 2016-06-30T10:53:54-0700 (9m 21s ago)
: process/ext_sentences/run.sh
: mark_done process/ext_sentences
: ##############################################################################

: ## data/sentences ############################################################
: # Done: 2016-06-30T10:53:54-0700 (9m 21s ago)
: # no-op
: mark_done data/sentences
: ##############################################################################

## process/ext_sentences_serialized ##########################################
: # Done: 2016-06-30T10:08:48-0700 (54m 27s ago)
# Done: 2016-06-30T10:08:48-0700 (54m 26s ago)
process/ext_sentences_serialized/run.sh
mark_done process/ext_sentences_serialized
##############################################################################

## data/sentences_serialized #################################################
: # Done: 2016-06-30T10:08:48-0700 (54m 27s ago)
# Done: 2016-06-30T10:08:48-0700 (54m 26s ago)
# no-op
mark_done data/sentences_serialized
##############################################################################

## process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local ########
# Done: N/A
process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local/run.sh
mark_done process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local
##############################################################################

## data/entity_taxon_candidate_local #########################################
# Done: N/A
# no-op
mark_done data/entity_taxon_candidate_local
##############################################################################

## process/ext_taxon_per_doc #################################################
# Done: N/A
process/ext_taxon_per_doc/run.sh
mark_done process/ext_taxon_per_doc
##############################################################################

## data/taxon_per_doc ########################################################
# Done: N/A
# no-op
mark_done data/taxon_per_doc
##############################################################################

