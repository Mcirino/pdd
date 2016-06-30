# on DN0a222566.SUNet: deepdive do probabilities
# run/20160630/111336.322287000/plan.sh
# execution plan for data/model/probabilities

: ## process/init/app ##########################################################
: # Done: 2016-06-30T09:53:31-0700 (1h 20m 6s ago)
: process/init/app/run.sh
: mark_done process/init/app
: ##############################################################################

: ## process/init/relation/sentences_original ##################################
: # Done: 2016-06-30T09:53:38-0700 (1h 19m 59s ago)
: process/init/relation/sentences_original/run.sh
: mark_done process/init/relation/sentences_original
: ##############################################################################

: ## data/sentences_original ###################################################
: # Done: 2016-06-30T09:53:38-0700 (1h 20m ago)
: # no-op
: mark_done data/sentences_original
: ##############################################################################

: ## process/ext_sentences #####################################################
: # Done: 2016-06-30T10:53:54-0700 (19m 44s ago)
: process/ext_sentences/run.sh
: mark_done process/ext_sentences
: ##############################################################################

: ## data/sentences ############################################################
: # Done: 2016-06-30T10:53:54-0700 (19m 44s ago)
: # no-op
: mark_done data/sentences
: ##############################################################################

: ## process/ext_sentences_serialized ##########################################
: # Done: 2016-06-30T11:03:29-0700 (10m 9s ago)
: process/ext_sentences_serialized/run.sh
: mark_done process/ext_sentences_serialized
: ##############################################################################

: ## data/sentences_serialized #################################################
: # Done: 2016-06-30T11:03:29-0700 (10m 9s ago)
: # no-op
: mark_done data/sentences_serialized
: ##############################################################################

## process/ext_documents #####################################################
: # Done: 2016-06-30T10:08:55-0700 (1h 4m 43s ago)
# Done: 2016-06-30T10:08:55-0700 (1h 4m 41s ago)
process/ext_documents/run.sh
mark_done process/ext_documents
##############################################################################

## data/documents ############################################################
: # Done: 2016-06-30T10:08:55-0700 (1h 4m 43s ago)
# Done: 2016-06-30T10:08:55-0700 (1h 4m 41s ago)
# no-op
mark_done data/documents
##############################################################################

## process/ext_documents_serialized ##########################################
# Done: N/A
process/ext_documents_serialized/run.sh
mark_done process/ext_documents_serialized
##############################################################################

## data/documents_serialized #################################################
# Done: N/A
# no-op
mark_done data/documents_serialized
##############################################################################

## process/ext_entity_formation_candidate_local_by_ext_entity_formation_local null
# Done: N/A
process/ext_entity_formation_candidate_local_by_ext_entity_formation_local/run.sh
mark_done process/ext_entity_formation_candidate_local_by_ext_entity_formation_local
##############################################################################

## data/entity_formation_candidate_local #####################################
# Done: N/A
# no-op
mark_done data/entity_formation_candidate_local
##############################################################################

## process/ext_formation_per_doc #############################################
# Done: N/A
process/ext_formation_per_doc/run.sh
mark_done process/ext_formation_per_doc
##############################################################################

## data/formation_per_doc ####################################################
# Done: N/A
# no-op
mark_done data/formation_per_doc
##############################################################################

## process/ext_document_with_formation_entities ##############################
# Done: N/A
process/ext_document_with_formation_entities/run.sh
mark_done process/ext_document_with_formation_entities
##############################################################################

## data/document_with_formation_entities #####################################
# Done: N/A
# no-op
mark_done data/document_with_formation_entities
##############################################################################

## process/ext_entity_formation_candidate__0_by_ext_entity_formation_global ##
# Done: N/A
process/ext_entity_formation_candidate__0_by_ext_entity_formation_global/run.sh
mark_done process/ext_entity_formation_candidate__0_by_ext_entity_formation_global
##############################################################################

## data/entity_formation_candidate__0 ########################################
# Done: N/A
# no-op
mark_done data/entity_formation_candidate__0
##############################################################################

## process/ext_entity_formation_candidate ####################################
# Done: N/A
process/ext_entity_formation_candidate/run.sh
mark_done process/ext_entity_formation_candidate
##############################################################################

## data/entity_formation_candidate ###########################################
# Done: N/A
# no-op
mark_done data/entity_formation_candidate
##############################################################################

## process/ext_entity_formation ##############################################
# Done: N/A
process/ext_entity_formation/run.sh
mark_done process/ext_entity_formation
##############################################################################

## data/entity_formation #####################################################
# Done: N/A
# no-op
mark_done data/entity_formation
##############################################################################

## process/ext_entity_location_candidate_by_ext_entity_location_global #######
# Done: N/A
process/ext_entity_location_candidate_by_ext_entity_location_global/run.sh
mark_done process/ext_entity_location_candidate_by_ext_entity_location_global
##############################################################################

## data/entity_location_candidate ############################################
# Done: N/A
# no-op
mark_done data/entity_location_candidate
##############################################################################

## process/ext_entity_location ###############################################
# Done: N/A
process/ext_entity_location/run.sh
mark_done process/ext_entity_location
##############################################################################

## data/entity_location ######################################################
# Done: N/A
# no-op
mark_done data/entity_location
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

## process/ext_document_with_taxon_entities ##################################
# Done: N/A
process/ext_document_with_taxon_entities/run.sh
mark_done process/ext_document_with_taxon_entities
##############################################################################

## data/document_with_taxon_entities #########################################
# Done: N/A
# no-op
mark_done data/document_with_taxon_entities
##############################################################################

## process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global ##########
# Done: N/A
process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global/run.sh
mark_done process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global
##############################################################################

## data/entity_taxon_candidate__0 ############################################
# Done: N/A
# no-op
mark_done data/entity_taxon_candidate__0
##############################################################################

## process/ext_entity_taxon_candidate ########################################
# Done: N/A
process/ext_entity_taxon_candidate/run.sh
mark_done process/ext_entity_taxon_candidate
##############################################################################

## data/entity_taxon_candidate ###############################################
# Done: N/A
# no-op
mark_done data/entity_taxon_candidate
##############################################################################

## process/ext_entity_taxon ##################################################
# Done: N/A
process/ext_entity_taxon/run.sh
mark_done process/ext_entity_taxon
##############################################################################

## data/entity_taxon #########################################################
# Done: N/A
# no-op
mark_done data/entity_taxon
##############################################################################

## process/ext_entity_temporal_candidate_by_ext_entity_temporal_local ########
# Done: N/A
process/ext_entity_temporal_candidate_by_ext_entity_temporal_local/run.sh
mark_done process/ext_entity_temporal_candidate_by_ext_entity_temporal_local
##############################################################################

## data/entity_temporal_candidate ############################################
# Done: N/A
# no-op
mark_done data/entity_temporal_candidate
##############################################################################

## process/ext_entity_temporal ###############################################
# Done: N/A
process/ext_entity_temporal/run.sh
mark_done process/ext_entity_temporal
##############################################################################

## data/entity_temporal ######################################################
# Done: N/A
# no-op
mark_done data/entity_temporal
##############################################################################

## process/ext_all_entity_candidate ##########################################
# Done: N/A
process/ext_all_entity_candidate/run.sh
mark_done process/ext_all_entity_candidate
##############################################################################

## data/all_entity_candidate #################################################
# Done: N/A
# no-op
mark_done data/all_entity_candidate
##############################################################################

## process/ext_all_entity_per_doc ############################################
# Done: N/A
process/ext_all_entity_per_doc/run.sh
mark_done process/ext_all_entity_per_doc
##############################################################################

## data/all_entity_per_doc ###################################################
# Done: N/A
# no-op
mark_done data/all_entity_per_doc
##############################################################################

## process/ext_document_with_all_entities ####################################
# Done: N/A
process/ext_document_with_all_entities/run.sh
mark_done process/ext_document_with_all_entities
##############################################################################

## data/document_with_all_entities ###########################################
# Done: N/A
# no-op
mark_done data/document_with_all_entities
##############################################################################

## process/ext_relation_candidates_by_ext_relation_same_sent #################
# Done: N/A
process/ext_relation_candidates_by_ext_relation_same_sent/run.sh
mark_done process/ext_relation_candidates_by_ext_relation_same_sent
##############################################################################

## data/relation_candidates ##################################################
# Done: N/A
# no-op
mark_done data/relation_candidates
##############################################################################

## process/ext_relation_formation_supervise_by_ext_relation_variable_formation null
# Done: N/A
process/ext_relation_formation_supervise_by_ext_relation_variable_formation/run.sh
mark_done process/ext_relation_formation_supervise_by_ext_relation_variable_formation
##############################################################################

## data/relation_formation_supervise #########################################
# Done: N/A
# no-op
mark_done data/relation_formation_supervise
##############################################################################

## process/ext_relation_formation ############################################
# Done: N/A
process/ext_relation_formation/run.sh
mark_done process/ext_relation_formation
##############################################################################

## data/relation_formation ###################################################
# Done: N/A
# no-op
mark_done data/relation_formation
##############################################################################

## process/ext_relation_formation_global #####################################
# Done: N/A
process/ext_relation_formation_global/run.sh
mark_done process/ext_relation_formation_global
##############################################################################

## data/relation_formation_global ############################################
# Done: N/A
# no-op
mark_done data/relation_formation_global
##############################################################################

## process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal null
# Done: N/A
process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal/run.sh
mark_done process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal
##############################################################################

## data/relation_formationtemporal_supervise #################################
# Done: N/A
# no-op
mark_done data/relation_formationtemporal_supervise
##############################################################################

## process/ext_relation_formationtemporal ####################################
# Done: N/A
process/ext_relation_formationtemporal/run.sh
mark_done process/ext_relation_formationtemporal
##############################################################################

## data/relation_formationtemporal ###########################################
# Done: N/A
# no-op
mark_done data/relation_formationtemporal
##############################################################################

## process/ext_relation_formationtemporal_global #############################
# Done: N/A
process/ext_relation_formationtemporal_global/run.sh
mark_done process/ext_relation_formationtemporal_global
##############################################################################

## data/relation_formationtemporal_global ####################################
# Done: N/A
# no-op
mark_done data/relation_formationtemporal_global
##############################################################################

## process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy #
# Done: N/A
process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy/run.sh
mark_done process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy
##############################################################################

## data/relation_taxonomy_supervise ##########################################
# Done: N/A
# no-op
mark_done data/relation_taxonomy_supervise
##############################################################################

## process/ext_relation_taxonomy #############################################
# Done: N/A
process/ext_relation_taxonomy/run.sh
mark_done process/ext_relation_taxonomy
##############################################################################

## data/relation_taxonomy ####################################################
# Done: N/A
# no-op
mark_done data/relation_taxonomy
##############################################################################

## process/ext_relation_taxonomy_global ######################################
# Done: N/A
process/ext_relation_taxonomy_global/run.sh
mark_done process/ext_relation_taxonomy_global
##############################################################################

## data/relation_taxonomy_global #############################################
# Done: N/A
# no-op
mark_done data/relation_taxonomy_global
##############################################################################

## process/grounding/variable_id_partition ###################################
# Done: N/A
process/grounding/variable_id_partition/run.sh
mark_done process/grounding/variable_id_partition
##############################################################################

## process/grounding/variable/entity_formation/assign_id #####################
# Done: N/A
process/grounding/variable/entity_formation/assign_id/run.sh
mark_done process/grounding/variable/entity_formation/assign_id
##############################################################################

## process/grounding/factor/inf_istrue_entity_formation/materialize ##########
# Done: N/A
process/grounding/factor/inf_istrue_entity_formation/materialize/run.sh
mark_done process/grounding/factor/inf_istrue_entity_formation/materialize
##############################################################################

## process/grounding/variable/entity_location/assign_id ######################
# Done: N/A
process/grounding/variable/entity_location/assign_id/run.sh
mark_done process/grounding/variable/entity_location/assign_id
##############################################################################

## process/grounding/factor/inf_istrue_entity_location/materialize ###########
# Done: N/A
process/grounding/factor/inf_istrue_entity_location/materialize/run.sh
mark_done process/grounding/factor/inf_istrue_entity_location/materialize
##############################################################################

## process/grounding/variable/entity_taxon/assign_id #########################
# Done: N/A
process/grounding/variable/entity_taxon/assign_id/run.sh
mark_done process/grounding/variable/entity_taxon/assign_id
##############################################################################

## process/grounding/factor/inf_istrue_entity_taxon/materialize ##############
# Done: N/A
process/grounding/factor/inf_istrue_entity_taxon/materialize/run.sh
mark_done process/grounding/factor/inf_istrue_entity_taxon/materialize
##############################################################################

## process/grounding/variable/entity_temporal/assign_id ######################
# Done: N/A
process/grounding/variable/entity_temporal/assign_id/run.sh
mark_done process/grounding/variable/entity_temporal/assign_id
##############################################################################

## process/grounding/factor/inf_istrue_entity_temporal/materialize ###########
# Done: N/A
process/grounding/factor/inf_istrue_entity_temporal/materialize/run.sh
mark_done process/grounding/factor/inf_istrue_entity_temporal/materialize
##############################################################################

## process/grounding/variable/relation_formation/assign_id ###################
# Done: N/A
process/grounding/variable/relation_formation/assign_id/run.sh
mark_done process/grounding/variable/relation_formation/assign_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_formation/materialize ########
# Done: N/A
process/grounding/factor/inf_istrue_relation_formation/materialize/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formation/materialize
##############################################################################

## process/grounding/variable/relation_formation_global/assign_id ############
# Done: N/A
process/grounding/variable/relation_formation_global/assign_id/run.sh
mark_done process/grounding/variable/relation_formation_global/assign_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_formation_global/materialize #
# Done: N/A
process/grounding/factor/inf_istrue_relation_formation_global/materialize/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formation_global/materialize
##############################################################################

## process/grounding/variable/relation_formationtemporal/assign_id ###########
# Done: N/A
process/grounding/variable/relation_formationtemporal/assign_id/run.sh
mark_done process/grounding/variable/relation_formationtemporal/assign_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_formationtemporal/materialize null
# Done: N/A
process/grounding/factor/inf_istrue_relation_formationtemporal/materialize/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formationtemporal/materialize
##############################################################################

## process/grounding/variable/relation_formationtemporal_global/assign_id ####
# Done: N/A
process/grounding/variable/relation_formationtemporal_global/assign_id/run.sh
mark_done process/grounding/variable/relation_formationtemporal_global/assign_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize null
# Done: N/A
process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize
##############################################################################

## process/grounding/variable/relation_taxonomy/assign_id ####################
# Done: N/A
process/grounding/variable/relation_taxonomy/assign_id/run.sh
mark_done process/grounding/variable/relation_taxonomy/assign_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_taxonomy/materialize #########
# Done: N/A
process/grounding/factor/inf_istrue_relation_taxonomy/materialize/run.sh
mark_done process/grounding/factor/inf_istrue_relation_taxonomy/materialize
##############################################################################

## process/grounding/variable/relation_taxonomy_global/assign_id #############
# Done: N/A
process/grounding/variable/relation_taxonomy_global/assign_id/run.sh
mark_done process/grounding/variable/relation_taxonomy_global/assign_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize ##
# Done: N/A
process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize/run.sh
mark_done process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize
##############################################################################

## process/grounding/weight_id_partition #####################################
# Done: N/A
process/grounding/weight_id_partition/run.sh
mark_done process/grounding/weight_id_partition
##############################################################################

## process/grounding/factor/inf_istrue_entity_formation/assign_weight_id #####
# Done: N/A
process/grounding/factor/inf_istrue_entity_formation/assign_weight_id/run.sh
mark_done process/grounding/factor/inf_istrue_entity_formation/assign_weight_id
##############################################################################

## process/grounding/factor/inf_istrue_entity_formation/dump #################
# Done: N/A
process/grounding/factor/inf_istrue_entity_formation/dump/run.sh
mark_done process/grounding/factor/inf_istrue_entity_formation/dump
##############################################################################

## process/grounding/factor/inf_istrue_entity_formation/dump_weights #########
# Done: N/A
process/grounding/factor/inf_istrue_entity_formation/dump_weights/run.sh
mark_done process/grounding/factor/inf_istrue_entity_formation/dump_weights
##############################################################################

## process/grounding/factor/inf_istrue_entity_location/assign_weight_id ######
# Done: N/A
process/grounding/factor/inf_istrue_entity_location/assign_weight_id/run.sh
mark_done process/grounding/factor/inf_istrue_entity_location/assign_weight_id
##############################################################################

## process/grounding/factor/inf_istrue_entity_location/dump ##################
# Done: N/A
process/grounding/factor/inf_istrue_entity_location/dump/run.sh
mark_done process/grounding/factor/inf_istrue_entity_location/dump
##############################################################################

## process/grounding/factor/inf_istrue_entity_location/dump_weights ##########
# Done: N/A
process/grounding/factor/inf_istrue_entity_location/dump_weights/run.sh
mark_done process/grounding/factor/inf_istrue_entity_location/dump_weights
##############################################################################

## process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id #########
# Done: N/A
process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id/run.sh
mark_done process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id
##############################################################################

## process/grounding/factor/inf_istrue_entity_taxon/dump #####################
# Done: N/A
process/grounding/factor/inf_istrue_entity_taxon/dump/run.sh
mark_done process/grounding/factor/inf_istrue_entity_taxon/dump
##############################################################################

## process/grounding/factor/inf_istrue_entity_taxon/dump_weights #############
# Done: N/A
process/grounding/factor/inf_istrue_entity_taxon/dump_weights/run.sh
mark_done process/grounding/factor/inf_istrue_entity_taxon/dump_weights
##############################################################################

## process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id ######
# Done: N/A
process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id/run.sh
mark_done process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id
##############################################################################

## process/grounding/factor/inf_istrue_entity_temporal/dump ##################
# Done: N/A
process/grounding/factor/inf_istrue_entity_temporal/dump/run.sh
mark_done process/grounding/factor/inf_istrue_entity_temporal/dump
##############################################################################

## process/grounding/factor/inf_istrue_entity_temporal/dump_weights ##########
# Done: N/A
process/grounding/factor/inf_istrue_entity_temporal/dump_weights/run.sh
mark_done process/grounding/factor/inf_istrue_entity_temporal/dump_weights
##############################################################################

## process/grounding/factor/inf_istrue_relation_formation/assign_weight_id ###
# Done: N/A
process/grounding/factor/inf_istrue_relation_formation/assign_weight_id/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formation/assign_weight_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_formation/dump ###############
# Done: N/A
process/grounding/factor/inf_istrue_relation_formation/dump/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formation/dump
##############################################################################

## process/grounding/factor/inf_istrue_relation_formation/dump_weights #######
# Done: N/A
process/grounding/factor/inf_istrue_relation_formation/dump_weights/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formation/dump_weights
##############################################################################

## process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id null
# Done: N/A
process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_formation_global/dump ########
# Done: N/A
process/grounding/factor/inf_istrue_relation_formation_global/dump/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formation_global/dump
##############################################################################

## process/grounding/factor/inf_istrue_relation_formation_global/dump_weights null
# Done: N/A
process/grounding/factor/inf_istrue_relation_formation_global/dump_weights/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formation_global/dump_weights
##############################################################################

## process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id null
# Done: N/A
process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_formationtemporal/dump #######
# Done: N/A
process/grounding/factor/inf_istrue_relation_formationtemporal/dump/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formationtemporal/dump
##############################################################################

## process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights null
# Done: N/A
process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights
##############################################################################

## process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id null
# Done: N/A
process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump null
# Done: N/A
process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump
##############################################################################

## process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights null
# Done: N/A
process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights/run.sh
mark_done process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights
##############################################################################

## process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id ####
# Done: N/A
process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id/run.sh
mark_done process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_taxonomy/dump ################
# Done: N/A
process/grounding/factor/inf_istrue_relation_taxonomy/dump/run.sh
mark_done process/grounding/factor/inf_istrue_relation_taxonomy/dump
##############################################################################

## process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights ########
# Done: N/A
process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights/run.sh
mark_done process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights
##############################################################################

## process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id null
# Done: N/A
process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id/run.sh
mark_done process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id
##############################################################################

## process/grounding/factor/inf_istrue_relation_taxonomy_global/dump #########
# Done: N/A
process/grounding/factor/inf_istrue_relation_taxonomy_global/dump/run.sh
mark_done process/grounding/factor/inf_istrue_relation_taxonomy_global/dump
##############################################################################

## process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights #
# Done: N/A
process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights/run.sh
mark_done process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights
##############################################################################

## process/grounding/global_weight_table #####################################
# Done: N/A
process/grounding/global_weight_table/run.sh
mark_done process/grounding/global_weight_table
##############################################################################

## process/grounding/variable_holdout ########################################
# Done: N/A
process/grounding/variable_holdout/run.sh
mark_done process/grounding/variable_holdout
##############################################################################

## process/grounding/variable/entity_formation/dump ##########################
# Done: N/A
process/grounding/variable/entity_formation/dump/run.sh
mark_done process/grounding/variable/entity_formation/dump
##############################################################################

## process/grounding/variable/entity_location/dump ###########################
# Done: N/A
process/grounding/variable/entity_location/dump/run.sh
mark_done process/grounding/variable/entity_location/dump
##############################################################################

## process/grounding/variable/entity_taxon/dump ##############################
# Done: N/A
process/grounding/variable/entity_taxon/dump/run.sh
mark_done process/grounding/variable/entity_taxon/dump
##############################################################################

## process/grounding/variable/entity_temporal/dump ###########################
# Done: N/A
process/grounding/variable/entity_temporal/dump/run.sh
mark_done process/grounding/variable/entity_temporal/dump
##############################################################################

## process/grounding/variable/relation_formation/dump ########################
# Done: N/A
process/grounding/variable/relation_formation/dump/run.sh
mark_done process/grounding/variable/relation_formation/dump
##############################################################################

## process/grounding/variable/relation_formation_global/dump #################
# Done: N/A
process/grounding/variable/relation_formation_global/dump/run.sh
mark_done process/grounding/variable/relation_formation_global/dump
##############################################################################

## process/grounding/variable/relation_formationtemporal/dump ################
# Done: N/A
process/grounding/variable/relation_formationtemporal/dump/run.sh
mark_done process/grounding/variable/relation_formationtemporal/dump
##############################################################################

## process/grounding/variable/relation_formationtemporal_global/dump #########
# Done: N/A
process/grounding/variable/relation_formationtemporal_global/dump/run.sh
mark_done process/grounding/variable/relation_formationtemporal_global/dump
##############################################################################

## process/grounding/variable/relation_taxonomy/dump #########################
# Done: N/A
process/grounding/variable/relation_taxonomy/dump/run.sh
mark_done process/grounding/variable/relation_taxonomy/dump
##############################################################################

## process/grounding/variable/relation_taxonomy_global/dump ##################
# Done: N/A
process/grounding/variable/relation_taxonomy_global/dump/run.sh
mark_done process/grounding/variable/relation_taxonomy_global/dump
##############################################################################

## process/grounding/combine_factorgraph #####################################
# Done: N/A
process/grounding/combine_factorgraph/run.sh
mark_done process/grounding/combine_factorgraph
##############################################################################

## model/factorgraph #########################################################
# Done: N/A
mark_done model/factorgraph
##############################################################################

## process/model/learning ####################################################
# Done: N/A
process/model/learning/run.sh
mark_done process/model/learning
##############################################################################

## model/weights #############################################################
# Done: N/A
mark_done model/weights
##############################################################################

## process/model/inference ###################################################
# Done: N/A
process/model/inference/run.sh
mark_done process/model/inference
##############################################################################

## model/probabilities #######################################################
# Done: N/A
mark_done model/probabilities
##############################################################################

## process/model/load_probabilities ##########################################
# Done: N/A
process/model/load_probabilities/run.sh
mark_done process/model/load_probabilities
##############################################################################

## data/model/probabilities ##################################################
# Done: N/A
# no-op
mark_done data/model/probabilities
##############################################################################

