
# default commands
define CMD_data
# no-op
endef
define CMD_pipeline
# no-op
endef
define CMD_process
# no-op
endef
define CMD_factor
# no-op
endef
define TOUCH
endef
define RESET
rm -f
endef

.DEFAULT: help
help:
	@echo make list
	@echo make list-targets
	@echo make all
	@echo make reset
list:
	@printf "%s\n" 'data/all_entity_candidate' 'data/all_entity_per_doc' 'data/document_with_all_entities' 'data/document_with_formation_entities' 'data/document_with_taxon_entities' 'data/documents' 'data/documents_serialized' 'data/entity_formation' 'data/entity_formation_candidate' 'data/entity_formation_candidate__0' 'data/entity_formation_candidate_local' 'data/entity_location' 'data/entity_location_candidate' 'data/entity_taxon' 'data/entity_taxon_candidate' 'data/entity_taxon_candidate__0' 'data/entity_taxon_candidate_local' 'data/entity_temporal' 'data/entity_temporal_candidate' 'data/formation_per_doc' 'data/model/probabilities' 'data/model/weights' 'data/relation_candidates' 'data/relation_formation' 'data/relation_formation_global' 'data/relation_formation_supervise' 'data/relation_formationtemporal' 'data/relation_formationtemporal_global' 'data/relation_formationtemporal_supervise' 'data/relation_taxonomy' 'data/relation_taxonomy_global' 'data/relation_taxonomy_supervise' 'data/sentences' 'data/sentences_original' 'data/sentences_serialized' 'data/taxon_per_doc' 'model/calibration-plots' 'model/factorgraph' 'model/probabilities' 'model/weights' 'process/ext_all_entity_candidate' 'process/ext_all_entity_per_doc' 'process/ext_document_with_all_entities' 'process/ext_document_with_formation_entities' 'process/ext_document_with_taxon_entities' 'process/ext_documents' 'process/ext_documents_serialized' 'process/ext_entity_formation' 'process/ext_entity_formation_candidate' 'process/ext_entity_formation_candidate__0_by_ext_entity_formation_global' 'process/ext_entity_formation_candidate_local_by_ext_entity_formation_local' 'process/ext_entity_location' 'process/ext_entity_location_candidate_by_ext_entity_location_global' 'process/ext_entity_taxon' 'process/ext_entity_taxon_candidate' 'process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global' 'process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local' 'process/ext_entity_temporal' 'process/ext_entity_temporal_candidate_by_ext_entity_temporal_local' 'process/ext_formation_per_doc' 'process/ext_relation_candidates_by_ext_relation_same_sent' 'process/ext_relation_formation' 'process/ext_relation_formation_global' 'process/ext_relation_formation_supervise_by_ext_relation_variable_formation' 'process/ext_relation_formationtemporal' 'process/ext_relation_formationtemporal_global' 'process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal' 'process/ext_relation_taxonomy' 'process/ext_relation_taxonomy_global' 'process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy' 'process/ext_sentences' 'process/ext_sentences_serialized' 'process/ext_taxon_per_doc' 'process/grounding/combine_factorgraph' 'process/grounding/factor/inf_istrue_entity_formation/assign_weight_id' 'process/grounding/factor/inf_istrue_entity_formation/dump' 'process/grounding/factor/inf_istrue_entity_formation/dump_weights' 'process/grounding/factor/inf_istrue_entity_formation/materialize' 'process/grounding/factor/inf_istrue_entity_location/assign_weight_id' 'process/grounding/factor/inf_istrue_entity_location/dump' 'process/grounding/factor/inf_istrue_entity_location/dump_weights' 'process/grounding/factor/inf_istrue_entity_location/materialize' 'process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id' 'process/grounding/factor/inf_istrue_entity_taxon/dump' 'process/grounding/factor/inf_istrue_entity_taxon/dump_weights' 'process/grounding/factor/inf_istrue_entity_taxon/materialize' 'process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id' 'process/grounding/factor/inf_istrue_entity_temporal/dump' 'process/grounding/factor/inf_istrue_entity_temporal/dump_weights' 'process/grounding/factor/inf_istrue_entity_temporal/materialize' 'process/grounding/factor/inf_istrue_relation_formation/assign_weight_id' 'process/grounding/factor/inf_istrue_relation_formation/dump' 'process/grounding/factor/inf_istrue_relation_formation/dump_weights' 'process/grounding/factor/inf_istrue_relation_formation/materialize' 'process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id' 'process/grounding/factor/inf_istrue_relation_formation_global/dump' 'process/grounding/factor/inf_istrue_relation_formation_global/dump_weights' 'process/grounding/factor/inf_istrue_relation_formation_global/materialize' 'process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id' 'process/grounding/factor/inf_istrue_relation_formationtemporal/dump' 'process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights' 'process/grounding/factor/inf_istrue_relation_formationtemporal/materialize' 'process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id' 'process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump' 'process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights' 'process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize' 'process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id' 'process/grounding/factor/inf_istrue_relation_taxonomy/dump' 'process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights' 'process/grounding/factor/inf_istrue_relation_taxonomy/materialize' 'process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id' 'process/grounding/factor/inf_istrue_relation_taxonomy_global/dump' 'process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights' 'process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize' 'process/grounding/global_weight_table' 'process/grounding/variable/entity_formation/assign_id' 'process/grounding/variable/entity_formation/dump' 'process/grounding/variable/entity_location/assign_id' 'process/grounding/variable/entity_location/dump' 'process/grounding/variable/entity_taxon/assign_id' 'process/grounding/variable/entity_taxon/dump' 'process/grounding/variable/entity_temporal/assign_id' 'process/grounding/variable/entity_temporal/dump' 'process/grounding/variable/relation_formation/assign_id' 'process/grounding/variable/relation_formation/dump' 'process/grounding/variable/relation_formation_global/assign_id' 'process/grounding/variable/relation_formation_global/dump' 'process/grounding/variable/relation_formationtemporal/assign_id' 'process/grounding/variable/relation_formationtemporal/dump' 'process/grounding/variable/relation_formationtemporal_global/assign_id' 'process/grounding/variable/relation_formationtemporal_global/dump' 'process/grounding/variable/relation_taxonomy/assign_id' 'process/grounding/variable/relation_taxonomy/dump' 'process/grounding/variable/relation_taxonomy_global/assign_id' 'process/grounding/variable/relation_taxonomy_global/dump' 'process/grounding/variable_holdout' 'process/grounding/variable_id_partition' 'process/grounding/weight_id_partition' 'process/init/app' 'process/init/relation/sentences_original' 'process/model/calibration' 'process/model/inference' 'process/model/learning' 'process/model/load_probabilities' 'process/model/load_weights'
list-targets:
	@printf "make %s\n" 'data/all_entity_candidate.done' 'data/all_entity_per_doc.done' 'data/document_with_all_entities.done' 'data/document_with_formation_entities.done' 'data/document_with_taxon_entities.done' 'data/documents.done' 'data/documents_serialized.done' 'data/entity_formation.done' 'data/entity_formation_candidate.done' 'data/entity_formation_candidate__0.done' 'data/entity_formation_candidate_local.done' 'data/entity_location.done' 'data/entity_location_candidate.done' 'data/entity_taxon.done' 'data/entity_taxon_candidate.done' 'data/entity_taxon_candidate__0.done' 'data/entity_taxon_candidate_local.done' 'data/entity_temporal.done' 'data/entity_temporal_candidate.done' 'data/formation_per_doc.done' 'data/model/probabilities.done' 'data/model/weights.done' 'data/relation_candidates.done' 'data/relation_formation.done' 'data/relation_formation_global.done' 'data/relation_formation_supervise.done' 'data/relation_formationtemporal.done' 'data/relation_formationtemporal_global.done' 'data/relation_formationtemporal_supervise.done' 'data/relation_taxonomy.done' 'data/relation_taxonomy_global.done' 'data/relation_taxonomy_supervise.done' 'data/sentences.done' 'data/sentences_original.done' 'data/sentences_serialized.done' 'data/taxon_per_doc.done' 'model/calibration-plots.done' 'model/factorgraph.done' 'model/probabilities.done' 'model/weights.done' 'process/ext_all_entity_candidate.done' 'process/ext_all_entity_per_doc.done' 'process/ext_document_with_all_entities.done' 'process/ext_document_with_formation_entities.done' 'process/ext_document_with_taxon_entities.done' 'process/ext_documents.done' 'process/ext_documents_serialized.done' 'process/ext_entity_formation.done' 'process/ext_entity_formation_candidate.done' 'process/ext_entity_formation_candidate__0_by_ext_entity_formation_global.done' 'process/ext_entity_formation_candidate_local_by_ext_entity_formation_local.done' 'process/ext_entity_location.done' 'process/ext_entity_location_candidate_by_ext_entity_location_global.done' 'process/ext_entity_taxon.done' 'process/ext_entity_taxon_candidate.done' 'process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global.done' 'process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local.done' 'process/ext_entity_temporal.done' 'process/ext_entity_temporal_candidate_by_ext_entity_temporal_local.done' 'process/ext_formation_per_doc.done' 'process/ext_relation_candidates_by_ext_relation_same_sent.done' 'process/ext_relation_formation.done' 'process/ext_relation_formation_global.done' 'process/ext_relation_formation_supervise_by_ext_relation_variable_formation.done' 'process/ext_relation_formationtemporal.done' 'process/ext_relation_formationtemporal_global.done' 'process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal.done' 'process/ext_relation_taxonomy.done' 'process/ext_relation_taxonomy_global.done' 'process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy.done' 'process/ext_sentences.done' 'process/ext_sentences_serialized.done' 'process/ext_taxon_per_doc.done' 'process/grounding/combine_factorgraph.done' 'process/grounding/factor/inf_istrue_entity_formation/assign_weight_id.done' 'process/grounding/factor/inf_istrue_entity_formation/dump.done' 'process/grounding/factor/inf_istrue_entity_formation/dump_weights.done' 'process/grounding/factor/inf_istrue_entity_formation/materialize.done' 'process/grounding/factor/inf_istrue_entity_location/assign_weight_id.done' 'process/grounding/factor/inf_istrue_entity_location/dump.done' 'process/grounding/factor/inf_istrue_entity_location/dump_weights.done' 'process/grounding/factor/inf_istrue_entity_location/materialize.done' 'process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id.done' 'process/grounding/factor/inf_istrue_entity_taxon/dump.done' 'process/grounding/factor/inf_istrue_entity_taxon/dump_weights.done' 'process/grounding/factor/inf_istrue_entity_taxon/materialize.done' 'process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id.done' 'process/grounding/factor/inf_istrue_entity_temporal/dump.done' 'process/grounding/factor/inf_istrue_entity_temporal/dump_weights.done' 'process/grounding/factor/inf_istrue_entity_temporal/materialize.done' 'process/grounding/factor/inf_istrue_relation_formation/assign_weight_id.done' 'process/grounding/factor/inf_istrue_relation_formation/dump.done' 'process/grounding/factor/inf_istrue_relation_formation/dump_weights.done' 'process/grounding/factor/inf_istrue_relation_formation/materialize.done' 'process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id.done' 'process/grounding/factor/inf_istrue_relation_formation_global/dump.done' 'process/grounding/factor/inf_istrue_relation_formation_global/dump_weights.done' 'process/grounding/factor/inf_istrue_relation_formation_global/materialize.done' 'process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id.done' 'process/grounding/factor/inf_istrue_relation_formationtemporal/dump.done' 'process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights.done' 'process/grounding/factor/inf_istrue_relation_formationtemporal/materialize.done' 'process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id.done' 'process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump.done' 'process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights.done' 'process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize.done' 'process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id.done' 'process/grounding/factor/inf_istrue_relation_taxonomy/dump.done' 'process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights.done' 'process/grounding/factor/inf_istrue_relation_taxonomy/materialize.done' 'process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id.done' 'process/grounding/factor/inf_istrue_relation_taxonomy_global/dump.done' 'process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights.done' 'process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize.done' 'process/grounding/global_weight_table.done' 'process/grounding/variable/entity_formation/assign_id.done' 'process/grounding/variable/entity_formation/dump.done' 'process/grounding/variable/entity_location/assign_id.done' 'process/grounding/variable/entity_location/dump.done' 'process/grounding/variable/entity_taxon/assign_id.done' 'process/grounding/variable/entity_taxon/dump.done' 'process/grounding/variable/entity_temporal/assign_id.done' 'process/grounding/variable/entity_temporal/dump.done' 'process/grounding/variable/relation_formation/assign_id.done' 'process/grounding/variable/relation_formation/dump.done' 'process/grounding/variable/relation_formation_global/assign_id.done' 'process/grounding/variable/relation_formation_global/dump.done' 'process/grounding/variable/relation_formationtemporal/assign_id.done' 'process/grounding/variable/relation_formationtemporal/dump.done' 'process/grounding/variable/relation_formationtemporal_global/assign_id.done' 'process/grounding/variable/relation_formationtemporal_global/dump.done' 'process/grounding/variable/relation_taxonomy/assign_id.done' 'process/grounding/variable/relation_taxonomy/dump.done' 'process/grounding/variable/relation_taxonomy_global/assign_id.done' 'process/grounding/variable/relation_taxonomy_global/dump.done' 'process/grounding/variable_holdout.done' 'process/grounding/variable_id_partition.done' 'process/grounding/weight_id_partition.done' 'process/init/app.done' 'process/init/relation/sentences_original.done' 'process/model/calibration.done' 'process/model/inference.done' 'process/model/learning.done' 'process/model/load_probabilities.done' 'process/model/load_weights.done'
	@echo "make     FOO.reset       # resets  FOO.done"
	@echo "make -tB FOO.done        # assumes FOO.done"
	@echo "make TOUCH=    FOO.done  # shows what still needs to run to get FOO.done"
	@echo "make TOUCH= -B FOO.done  # shows everything that needs to run to get FOO.done"
all: data/all_entity_candidate.done data/all_entity_per_doc.done data/document_with_all_entities.done data/document_with_formation_entities.done data/document_with_taxon_entities.done data/documents.done data/documents_serialized.done data/entity_formation.done data/entity_formation_candidate.done data/entity_formation_candidate__0.done data/entity_formation_candidate_local.done data/entity_location.done data/entity_location_candidate.done data/entity_taxon.done data/entity_taxon_candidate.done data/entity_taxon_candidate__0.done data/entity_taxon_candidate_local.done data/entity_temporal.done data/entity_temporal_candidate.done data/formation_per_doc.done data/model/probabilities.done data/model/weights.done data/relation_candidates.done data/relation_formation.done data/relation_formation_global.done data/relation_formation_supervise.done data/relation_formationtemporal.done data/relation_formationtemporal_global.done data/relation_formationtemporal_supervise.done data/relation_taxonomy.done data/relation_taxonomy_global.done data/relation_taxonomy_supervise.done data/sentences.done data/sentences_original.done data/sentences_serialized.done data/taxon_per_doc.done model/calibration-plots.done model/factorgraph.done model/probabilities.done model/weights.done process/ext_all_entity_candidate.done process/ext_all_entity_per_doc.done process/ext_document_with_all_entities.done process/ext_document_with_formation_entities.done process/ext_document_with_taxon_entities.done process/ext_documents.done process/ext_documents_serialized.done process/ext_entity_formation.done process/ext_entity_formation_candidate.done process/ext_entity_formation_candidate__0_by_ext_entity_formation_global.done process/ext_entity_formation_candidate_local_by_ext_entity_formation_local.done process/ext_entity_location.done process/ext_entity_location_candidate_by_ext_entity_location_global.done process/ext_entity_taxon.done process/ext_entity_taxon_candidate.done process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global.done process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local.done process/ext_entity_temporal.done process/ext_entity_temporal_candidate_by_ext_entity_temporal_local.done process/ext_formation_per_doc.done process/ext_relation_candidates_by_ext_relation_same_sent.done process/ext_relation_formation.done process/ext_relation_formation_global.done process/ext_relation_formation_supervise_by_ext_relation_variable_formation.done process/ext_relation_formationtemporal.done process/ext_relation_formationtemporal_global.done process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal.done process/ext_relation_taxonomy.done process/ext_relation_taxonomy_global.done process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy.done process/ext_sentences.done process/ext_sentences_serialized.done process/ext_taxon_per_doc.done process/grounding/combine_factorgraph.done process/grounding/factor/inf_istrue_entity_formation/assign_weight_id.done process/grounding/factor/inf_istrue_entity_formation/dump.done process/grounding/factor/inf_istrue_entity_formation/dump_weights.done process/grounding/factor/inf_istrue_entity_formation/materialize.done process/grounding/factor/inf_istrue_entity_location/assign_weight_id.done process/grounding/factor/inf_istrue_entity_location/dump.done process/grounding/factor/inf_istrue_entity_location/dump_weights.done process/grounding/factor/inf_istrue_entity_location/materialize.done process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id.done process/grounding/factor/inf_istrue_entity_taxon/dump.done process/grounding/factor/inf_istrue_entity_taxon/dump_weights.done process/grounding/factor/inf_istrue_entity_taxon/materialize.done process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id.done process/grounding/factor/inf_istrue_entity_temporal/dump.done process/grounding/factor/inf_istrue_entity_temporal/dump_weights.done process/grounding/factor/inf_istrue_entity_temporal/materialize.done process/grounding/factor/inf_istrue_relation_formation/assign_weight_id.done process/grounding/factor/inf_istrue_relation_formation/dump.done process/grounding/factor/inf_istrue_relation_formation/dump_weights.done process/grounding/factor/inf_istrue_relation_formation/materialize.done process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id.done process/grounding/factor/inf_istrue_relation_formation_global/dump.done process/grounding/factor/inf_istrue_relation_formation_global/dump_weights.done process/grounding/factor/inf_istrue_relation_formation_global/materialize.done process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id.done process/grounding/factor/inf_istrue_relation_formationtemporal/dump.done process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights.done process/grounding/factor/inf_istrue_relation_formationtemporal/materialize.done process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id.done process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump.done process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights.done process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize.done process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id.done process/grounding/factor/inf_istrue_relation_taxonomy/dump.done process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights.done process/grounding/factor/inf_istrue_relation_taxonomy/materialize.done process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id.done process/grounding/factor/inf_istrue_relation_taxonomy_global/dump.done process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights.done process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize.done process/grounding/global_weight_table.done process/grounding/variable/entity_formation/assign_id.done process/grounding/variable/entity_formation/dump.done process/grounding/variable/entity_location/assign_id.done process/grounding/variable/entity_location/dump.done process/grounding/variable/entity_taxon/assign_id.done process/grounding/variable/entity_taxon/dump.done process/grounding/variable/entity_temporal/assign_id.done process/grounding/variable/entity_temporal/dump.done process/grounding/variable/relation_formation/assign_id.done process/grounding/variable/relation_formation/dump.done process/grounding/variable/relation_formation_global/assign_id.done process/grounding/variable/relation_formation_global/dump.done process/grounding/variable/relation_formationtemporal/assign_id.done process/grounding/variable/relation_formationtemporal/dump.done process/grounding/variable/relation_formationtemporal_global/assign_id.done process/grounding/variable/relation_formationtemporal_global/dump.done process/grounding/variable/relation_taxonomy/assign_id.done process/grounding/variable/relation_taxonomy/dump.done process/grounding/variable/relation_taxonomy_global/assign_id.done process/grounding/variable/relation_taxonomy_global/dump.done process/grounding/variable_holdout.done process/grounding/variable_id_partition.done process/grounding/weight_id_partition.done process/init/app.done process/init/relation/sentences_original.done process/model/calibration.done process/model/inference.done process/model/learning.done process/model/load_probabilities.done process/model/load_weights.done
reset: data/all_entity_candidate.reset data/all_entity_per_doc.reset data/document_with_all_entities.reset data/document_with_formation_entities.reset data/document_with_taxon_entities.reset data/documents.reset data/documents_serialized.reset data/entity_formation.reset data/entity_formation_candidate.reset data/entity_formation_candidate__0.reset data/entity_formation_candidate_local.reset data/entity_location.reset data/entity_location_candidate.reset data/entity_taxon.reset data/entity_taxon_candidate.reset data/entity_taxon_candidate__0.reset data/entity_taxon_candidate_local.reset data/entity_temporal.reset data/entity_temporal_candidate.reset data/formation_per_doc.reset data/model/probabilities.reset data/model/weights.reset data/relation_candidates.reset data/relation_formation.reset data/relation_formation_global.reset data/relation_formation_supervise.reset data/relation_formationtemporal.reset data/relation_formationtemporal_global.reset data/relation_formationtemporal_supervise.reset data/relation_taxonomy.reset data/relation_taxonomy_global.reset data/relation_taxonomy_supervise.reset data/sentences.reset data/sentences_original.reset data/sentences_serialized.reset data/taxon_per_doc.reset model/calibration-plots.reset model/factorgraph.reset model/probabilities.reset model/weights.reset process/ext_all_entity_candidate.reset process/ext_all_entity_per_doc.reset process/ext_document_with_all_entities.reset process/ext_document_with_formation_entities.reset process/ext_document_with_taxon_entities.reset process/ext_documents.reset process/ext_documents_serialized.reset process/ext_entity_formation.reset process/ext_entity_formation_candidate.reset process/ext_entity_formation_candidate__0_by_ext_entity_formation_global.reset process/ext_entity_formation_candidate_local_by_ext_entity_formation_local.reset process/ext_entity_location.reset process/ext_entity_location_candidate_by_ext_entity_location_global.reset process/ext_entity_taxon.reset process/ext_entity_taxon_candidate.reset process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global.reset process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local.reset process/ext_entity_temporal.reset process/ext_entity_temporal_candidate_by_ext_entity_temporal_local.reset process/ext_formation_per_doc.reset process/ext_relation_candidates_by_ext_relation_same_sent.reset process/ext_relation_formation.reset process/ext_relation_formation_global.reset process/ext_relation_formation_supervise_by_ext_relation_variable_formation.reset process/ext_relation_formationtemporal.reset process/ext_relation_formationtemporal_global.reset process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal.reset process/ext_relation_taxonomy.reset process/ext_relation_taxonomy_global.reset process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy.reset process/ext_sentences.reset process/ext_sentences_serialized.reset process/ext_taxon_per_doc.reset process/grounding/combine_factorgraph.reset process/grounding/factor/inf_istrue_entity_formation/assign_weight_id.reset process/grounding/factor/inf_istrue_entity_formation/dump.reset process/grounding/factor/inf_istrue_entity_formation/dump_weights.reset process/grounding/factor/inf_istrue_entity_formation/materialize.reset process/grounding/factor/inf_istrue_entity_location/assign_weight_id.reset process/grounding/factor/inf_istrue_entity_location/dump.reset process/grounding/factor/inf_istrue_entity_location/dump_weights.reset process/grounding/factor/inf_istrue_entity_location/materialize.reset process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id.reset process/grounding/factor/inf_istrue_entity_taxon/dump.reset process/grounding/factor/inf_istrue_entity_taxon/dump_weights.reset process/grounding/factor/inf_istrue_entity_taxon/materialize.reset process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id.reset process/grounding/factor/inf_istrue_entity_temporal/dump.reset process/grounding/factor/inf_istrue_entity_temporal/dump_weights.reset process/grounding/factor/inf_istrue_entity_temporal/materialize.reset process/grounding/factor/inf_istrue_relation_formation/assign_weight_id.reset process/grounding/factor/inf_istrue_relation_formation/dump.reset process/grounding/factor/inf_istrue_relation_formation/dump_weights.reset process/grounding/factor/inf_istrue_relation_formation/materialize.reset process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id.reset process/grounding/factor/inf_istrue_relation_formation_global/dump.reset process/grounding/factor/inf_istrue_relation_formation_global/dump_weights.reset process/grounding/factor/inf_istrue_relation_formation_global/materialize.reset process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id.reset process/grounding/factor/inf_istrue_relation_formationtemporal/dump.reset process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights.reset process/grounding/factor/inf_istrue_relation_formationtemporal/materialize.reset process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id.reset process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump.reset process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights.reset process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize.reset process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id.reset process/grounding/factor/inf_istrue_relation_taxonomy/dump.reset process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights.reset process/grounding/factor/inf_istrue_relation_taxonomy/materialize.reset process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id.reset process/grounding/factor/inf_istrue_relation_taxonomy_global/dump.reset process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights.reset process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize.reset process/grounding/global_weight_table.reset process/grounding/variable/entity_formation/assign_id.reset process/grounding/variable/entity_formation/dump.reset process/grounding/variable/entity_location/assign_id.reset process/grounding/variable/entity_location/dump.reset process/grounding/variable/entity_taxon/assign_id.reset process/grounding/variable/entity_taxon/dump.reset process/grounding/variable/entity_temporal/assign_id.reset process/grounding/variable/entity_temporal/dump.reset process/grounding/variable/relation_formation/assign_id.reset process/grounding/variable/relation_formation/dump.reset process/grounding/variable/relation_formation_global/assign_id.reset process/grounding/variable/relation_formation_global/dump.reset process/grounding/variable/relation_formationtemporal/assign_id.reset process/grounding/variable/relation_formationtemporal/dump.reset process/grounding/variable/relation_formationtemporal_global/assign_id.reset process/grounding/variable/relation_formationtemporal_global/dump.reset process/grounding/variable/relation_taxonomy/assign_id.reset process/grounding/variable/relation_taxonomy/dump.reset process/grounding/variable/relation_taxonomy_global/assign_id.reset process/grounding/variable/relation_taxonomy_global/dump.reset process/grounding/variable_holdout.reset process/grounding/variable_id_partition.reset process/grounding/weight_id_partition.reset process/init/app.reset process/init/relation/sentences_original.reset process/model/calibration.reset process/model/inference.reset process/model/learning.reset process/model/load_probabilities.reset process/model/load_weights.reset
.PHONY: help list list-targets all reset %.reset


process/init/app.done: 
	## process/init/app ##########################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/init/app.reset:
	$(RESET) process/init/app.done

process/init/relation/sentences_original.done: process/init/app.done
	## process/init/relation/sentences_original ##################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/init/relation/sentences_original.reset:
	$(RESET) process/init/relation/sentences_original.done

process/ext_all_entity_candidate.done: data/entity_formation_candidate.done data/entity_location_candidate.done data/entity_taxon_candidate.done data/entity_temporal_candidate.done
	## process/ext_all_entity_candidate ##########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_all_entity_candidate.reset:
	$(RESET) process/ext_all_entity_candidate.done

process/ext_all_entity_per_doc.done: data/all_entity_candidate.done
	## process/ext_all_entity_per_doc ############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_all_entity_per_doc.reset:
	$(RESET) process/ext_all_entity_per_doc.done

process/ext_document_with_all_entities.done: data/all_entity_per_doc.done data/documents_serialized.done
	## process/ext_document_with_all_entities ####################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_document_with_all_entities.reset:
	$(RESET) process/ext_document_with_all_entities.done

process/ext_document_with_formation_entities.done: data/documents_serialized.done data/formation_per_doc.done
	## process/ext_document_with_formation_entities ##############################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_document_with_formation_entities.reset:
	$(RESET) process/ext_document_with_formation_entities.done

process/ext_document_with_taxon_entities.done: data/documents_serialized.done data/taxon_per_doc.done
	## process/ext_document_with_taxon_entities ##################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_document_with_taxon_entities.reset:
	$(RESET) process/ext_document_with_taxon_entities.done

process/ext_documents.done: data/sentences_serialized.done
	## process/ext_documents #####################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_documents.reset:
	$(RESET) process/ext_documents.done

process/ext_documents_serialized.done: data/documents.done
	## process/ext_documents_serialized ##########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_documents_serialized.reset:
	$(RESET) process/ext_documents_serialized.done

process/ext_entity_formation.done: data/entity_formation_candidate.done
	## process/ext_entity_formation ##############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_formation.reset:
	$(RESET) process/ext_entity_formation.done

process/ext_entity_formation_candidate.done: data/entity_formation_candidate__0.done data/entity_formation_candidate_local.done
	## process/ext_entity_formation_candidate ####################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_formation_candidate.reset:
	$(RESET) process/ext_entity_formation_candidate.done

process/ext_entity_formation_candidate__0_by_ext_entity_formation_global.done: data/document_with_formation_entities.done
	## process/ext_entity_formation_candidate__0_by_ext_entity_formation_global ##
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_formation_candidate__0_by_ext_entity_formation_global.reset:
	$(RESET) process/ext_entity_formation_candidate__0_by_ext_entity_formation_global.done

process/ext_entity_formation_candidate_local_by_ext_entity_formation_local.done: data/sentences_serialized.done
	## process/ext_entity_formation_candidate_local_by_ext_entity_formation_local null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_formation_candidate_local_by_ext_entity_formation_local.reset:
	$(RESET) process/ext_entity_formation_candidate_local_by_ext_entity_formation_local.done

process/ext_entity_location.done: data/entity_location_candidate.done
	## process/ext_entity_location ###############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_location.reset:
	$(RESET) process/ext_entity_location.done

process/ext_entity_location_candidate_by_ext_entity_location_global.done: data/documents_serialized.done
	## process/ext_entity_location_candidate_by_ext_entity_location_global #######
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_location_candidate_by_ext_entity_location_global.reset:
	$(RESET) process/ext_entity_location_candidate_by_ext_entity_location_global.done

process/ext_entity_taxon.done: data/entity_taxon_candidate.done
	## process/ext_entity_taxon ##################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_taxon.reset:
	$(RESET) process/ext_entity_taxon.done

process/ext_entity_taxon_candidate.done: data/entity_taxon_candidate__0.done data/entity_taxon_candidate_local.done
	## process/ext_entity_taxon_candidate ########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_taxon_candidate.reset:
	$(RESET) process/ext_entity_taxon_candidate.done

process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global.done: data/document_with_taxon_entities.done
	## process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global ##########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global.reset:
	$(RESET) process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global.done

process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local.done: data/sentences_serialized.done
	## process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local ########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local.reset:
	$(RESET) process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local.done

process/ext_entity_temporal.done: data/entity_temporal_candidate.done
	## process/ext_entity_temporal ###############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_temporal.reset:
	$(RESET) process/ext_entity_temporal.done

process/ext_entity_temporal_candidate_by_ext_entity_temporal_local.done: data/sentences_serialized.done
	## process/ext_entity_temporal_candidate_by_ext_entity_temporal_local ########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_entity_temporal_candidate_by_ext_entity_temporal_local.reset:
	$(RESET) process/ext_entity_temporal_candidate_by_ext_entity_temporal_local.done

process/ext_formation_per_doc.done: data/entity_formation_candidate_local.done
	## process/ext_formation_per_doc #############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_formation_per_doc.reset:
	$(RESET) process/ext_formation_per_doc.done

process/ext_relation_candidates_by_ext_relation_same_sent.done: data/document_with_all_entities.done
	## process/ext_relation_candidates_by_ext_relation_same_sent #################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_relation_candidates_by_ext_relation_same_sent.reset:
	$(RESET) process/ext_relation_candidates_by_ext_relation_same_sent.done

process/ext_relation_formation.done: data/relation_formation_supervise.done
	## process/ext_relation_formation ############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_relation_formation.reset:
	$(RESET) process/ext_relation_formation.done

process/ext_relation_formation_global.done: data/relation_formation.done
	## process/ext_relation_formation_global #####################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_relation_formation_global.reset:
	$(RESET) process/ext_relation_formation_global.done

process/ext_relation_formation_supervise_by_ext_relation_variable_formation.done: data/relation_candidates.done
	## process/ext_relation_formation_supervise_by_ext_relation_variable_formation null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_relation_formation_supervise_by_ext_relation_variable_formation.reset:
	$(RESET) process/ext_relation_formation_supervise_by_ext_relation_variable_formation.done

process/ext_relation_formationtemporal.done: data/relation_formationtemporal_supervise.done
	## process/ext_relation_formationtemporal ####################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_relation_formationtemporal.reset:
	$(RESET) process/ext_relation_formationtemporal.done

process/ext_relation_formationtemporal_global.done: data/relation_formationtemporal.done
	## process/ext_relation_formationtemporal_global #############################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_relation_formationtemporal_global.reset:
	$(RESET) process/ext_relation_formationtemporal_global.done

process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal.done: data/relation_candidates.done
	## process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal.reset:
	$(RESET) process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal.done

process/ext_relation_taxonomy.done: data/relation_taxonomy_supervise.done
	## process/ext_relation_taxonomy #############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_relation_taxonomy.reset:
	$(RESET) process/ext_relation_taxonomy.done

process/ext_relation_taxonomy_global.done: data/relation_taxonomy.done
	## process/ext_relation_taxonomy_global ######################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_relation_taxonomy_global.reset:
	$(RESET) process/ext_relation_taxonomy_global.done

process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy.done: data/relation_candidates.done
	## process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy #
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy.reset:
	$(RESET) process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy.done

process/ext_sentences.done: data/sentences_original.done
	## process/ext_sentences #####################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_sentences.reset:
	$(RESET) process/ext_sentences.done

process/ext_sentences_serialized.done: data/sentences.done
	## process/ext_sentences_serialized ##########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_sentences_serialized.reset:
	$(RESET) process/ext_sentences_serialized.done

process/ext_taxon_per_doc.done: data/entity_taxon_candidate_local.done
	## process/ext_taxon_per_doc #################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/ext_taxon_per_doc.reset:
	$(RESET) process/ext_taxon_per_doc.done

process/grounding/variable_id_partition.done: data/entity_formation.done data/entity_location.done data/entity_taxon.done data/entity_temporal.done data/relation_formation.done data/relation_formation_global.done data/relation_formationtemporal.done data/relation_formationtemporal_global.done data/relation_taxonomy.done data/relation_taxonomy_global.done
	## process/grounding/variable_id_partition ###################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable_id_partition.reset:
	$(RESET) process/grounding/variable_id_partition.done

process/grounding/variable/entity_formation/assign_id.done: process/grounding/variable_id_partition.done
	## process/grounding/variable/entity_formation/assign_id #####################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/entity_formation/assign_id.reset:
	$(RESET) process/grounding/variable/entity_formation/assign_id.done

process/grounding/variable/entity_location/assign_id.done: process/grounding/variable_id_partition.done
	## process/grounding/variable/entity_location/assign_id ######################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/entity_location/assign_id.reset:
	$(RESET) process/grounding/variable/entity_location/assign_id.done

process/grounding/variable/entity_taxon/assign_id.done: process/grounding/variable_id_partition.done
	## process/grounding/variable/entity_taxon/assign_id #########################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/entity_taxon/assign_id.reset:
	$(RESET) process/grounding/variable/entity_taxon/assign_id.done

process/grounding/variable/entity_temporal/assign_id.done: process/grounding/variable_id_partition.done
	## process/grounding/variable/entity_temporal/assign_id ######################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/entity_temporal/assign_id.reset:
	$(RESET) process/grounding/variable/entity_temporal/assign_id.done

process/grounding/variable/relation_formation/assign_id.done: process/grounding/variable_id_partition.done
	## process/grounding/variable/relation_formation/assign_id ###################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_formation/assign_id.reset:
	$(RESET) process/grounding/variable/relation_formation/assign_id.done

process/grounding/variable/relation_formation_global/assign_id.done: process/grounding/variable_id_partition.done
	## process/grounding/variable/relation_formation_global/assign_id ############
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_formation_global/assign_id.reset:
	$(RESET) process/grounding/variable/relation_formation_global/assign_id.done

process/grounding/variable/relation_formationtemporal/assign_id.done: process/grounding/variable_id_partition.done
	## process/grounding/variable/relation_formationtemporal/assign_id ###########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_formationtemporal/assign_id.reset:
	$(RESET) process/grounding/variable/relation_formationtemporal/assign_id.done

process/grounding/variable/relation_formationtemporal_global/assign_id.done: process/grounding/variable_id_partition.done
	## process/grounding/variable/relation_formationtemporal_global/assign_id ####
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_formationtemporal_global/assign_id.reset:
	$(RESET) process/grounding/variable/relation_formationtemporal_global/assign_id.done

process/grounding/variable/relation_taxonomy/assign_id.done: process/grounding/variable_id_partition.done
	## process/grounding/variable/relation_taxonomy/assign_id ####################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_taxonomy/assign_id.reset:
	$(RESET) process/grounding/variable/relation_taxonomy/assign_id.done

process/grounding/variable/relation_taxonomy_global/assign_id.done: process/grounding/variable_id_partition.done
	## process/grounding/variable/relation_taxonomy_global/assign_id #############
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_taxonomy_global/assign_id.reset:
	$(RESET) process/grounding/variable/relation_taxonomy_global/assign_id.done

process/grounding/variable_holdout.done: process/grounding/variable/entity_formation/assign_id.done process/grounding/variable/entity_location/assign_id.done process/grounding/variable/entity_taxon/assign_id.done process/grounding/variable/entity_temporal/assign_id.done process/grounding/variable/relation_formation/assign_id.done process/grounding/variable/relation_formation_global/assign_id.done process/grounding/variable/relation_formationtemporal/assign_id.done process/grounding/variable/relation_formationtemporal_global/assign_id.done process/grounding/variable/relation_taxonomy/assign_id.done process/grounding/variable/relation_taxonomy_global/assign_id.done
	## process/grounding/variable_holdout ########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable_holdout.reset:
	$(RESET) process/grounding/variable_holdout.done

process/grounding/variable/entity_formation/dump.done: process/grounding/variable_holdout.done
	## process/grounding/variable/entity_formation/dump ##########################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/entity_formation/dump.reset:
	$(RESET) process/grounding/variable/entity_formation/dump.done

process/grounding/variable/entity_location/dump.done: process/grounding/variable_holdout.done
	## process/grounding/variable/entity_location/dump ###########################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/entity_location/dump.reset:
	$(RESET) process/grounding/variable/entity_location/dump.done

process/grounding/variable/entity_taxon/dump.done: process/grounding/variable_holdout.done
	## process/grounding/variable/entity_taxon/dump ##############################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/entity_taxon/dump.reset:
	$(RESET) process/grounding/variable/entity_taxon/dump.done

process/grounding/variable/entity_temporal/dump.done: process/grounding/variable_holdout.done
	## process/grounding/variable/entity_temporal/dump ###########################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/entity_temporal/dump.reset:
	$(RESET) process/grounding/variable/entity_temporal/dump.done

process/grounding/variable/relation_formation/dump.done: process/grounding/variable_holdout.done
	## process/grounding/variable/relation_formation/dump ########################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_formation/dump.reset:
	$(RESET) process/grounding/variable/relation_formation/dump.done

process/grounding/variable/relation_formation_global/dump.done: process/grounding/variable_holdout.done
	## process/grounding/variable/relation_formation_global/dump #################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_formation_global/dump.reset:
	$(RESET) process/grounding/variable/relation_formation_global/dump.done

process/grounding/variable/relation_formationtemporal/dump.done: process/grounding/variable_holdout.done
	## process/grounding/variable/relation_formationtemporal/dump ################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_formationtemporal/dump.reset:
	$(RESET) process/grounding/variable/relation_formationtemporal/dump.done

process/grounding/variable/relation_formationtemporal_global/dump.done: process/grounding/variable_holdout.done
	## process/grounding/variable/relation_formationtemporal_global/dump #########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_formationtemporal_global/dump.reset:
	$(RESET) process/grounding/variable/relation_formationtemporal_global/dump.done

process/grounding/variable/relation_taxonomy/dump.done: process/grounding/variable_holdout.done
	## process/grounding/variable/relation_taxonomy/dump #########################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_taxonomy/dump.reset:
	$(RESET) process/grounding/variable/relation_taxonomy/dump.done

process/grounding/variable/relation_taxonomy_global/dump.done: process/grounding/variable_holdout.done
	## process/grounding/variable/relation_taxonomy_global/dump ##################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/variable/relation_taxonomy_global/dump.reset:
	$(RESET) process/grounding/variable/relation_taxonomy_global/dump.done

process/grounding/factor/inf_istrue_entity_formation/materialize.done: data/entity_formation_candidate.done process/grounding/variable/entity_formation/assign_id.done
	## process/grounding/factor/inf_istrue_entity_formation/materialize ##########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_formation/materialize.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_formation/materialize.done

process/grounding/factor/inf_istrue_entity_location/materialize.done: data/entity_location_candidate.done process/grounding/variable/entity_location/assign_id.done
	## process/grounding/factor/inf_istrue_entity_location/materialize ###########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_location/materialize.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_location/materialize.done

process/grounding/factor/inf_istrue_entity_taxon/materialize.done: data/entity_taxon_candidate.done process/grounding/variable/entity_taxon/assign_id.done
	## process/grounding/factor/inf_istrue_entity_taxon/materialize ##############
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_taxon/materialize.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_taxon/materialize.done

process/grounding/factor/inf_istrue_entity_temporal/materialize.done: data/entity_temporal_candidate.done process/grounding/variable/entity_temporal/assign_id.done
	## process/grounding/factor/inf_istrue_entity_temporal/materialize ###########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_temporal/materialize.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_temporal/materialize.done

process/grounding/factor/inf_istrue_relation_formation/materialize.done: data/relation_candidates.done process/grounding/variable/relation_formation/assign_id.done
	## process/grounding/factor/inf_istrue_relation_formation/materialize ########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formation/materialize.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formation/materialize.done

process/grounding/factor/inf_istrue_relation_formation_global/materialize.done: data/relation_candidates.done process/grounding/variable/relation_formation/assign_id.done process/grounding/variable/relation_formation_global/assign_id.done
	## process/grounding/factor/inf_istrue_relation_formation_global/materialize #
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formation_global/materialize.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formation_global/materialize.done

process/grounding/factor/inf_istrue_relation_formationtemporal/materialize.done: data/relation_candidates.done process/grounding/variable/entity_formation/assign_id.done process/grounding/variable/entity_temporal/assign_id.done process/grounding/variable/relation_formationtemporal/assign_id.done
	## process/grounding/factor/inf_istrue_relation_formationtemporal/materialize null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formationtemporal/materialize.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formationtemporal/materialize.done

process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize.done: data/relation_candidates.done process/grounding/variable/relation_formationtemporal/assign_id.done process/grounding/variable/relation_formationtemporal_global/assign_id.done
	## process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize.done

process/grounding/factor/inf_istrue_relation_taxonomy/materialize.done: data/relation_candidates.done process/grounding/variable/relation_taxonomy/assign_id.done
	## process/grounding/factor/inf_istrue_relation_taxonomy/materialize #########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_taxonomy/materialize.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_taxonomy/materialize.done

process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize.done: data/relation_candidates.done process/grounding/variable/relation_taxonomy/assign_id.done process/grounding/variable/relation_taxonomy_global/assign_id.done
	## process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize ##
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize.done

process/grounding/weight_id_partition.done: process/grounding/factor/inf_istrue_entity_formation/materialize.done process/grounding/factor/inf_istrue_entity_location/materialize.done process/grounding/factor/inf_istrue_entity_taxon/materialize.done process/grounding/factor/inf_istrue_entity_temporal/materialize.done process/grounding/factor/inf_istrue_relation_formation/materialize.done process/grounding/factor/inf_istrue_relation_formation_global/materialize.done process/grounding/factor/inf_istrue_relation_formationtemporal/materialize.done process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize.done process/grounding/factor/inf_istrue_relation_taxonomy/materialize.done process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize.done
	## process/grounding/weight_id_partition #####################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/weight_id_partition.reset:
	$(RESET) process/grounding/weight_id_partition.done

process/grounding/global_weight_table.done: process/grounding/factor/inf_istrue_entity_formation/materialize.done process/grounding/factor/inf_istrue_entity_location/materialize.done process/grounding/factor/inf_istrue_entity_taxon/materialize.done process/grounding/factor/inf_istrue_entity_temporal/materialize.done process/grounding/factor/inf_istrue_relation_formation/materialize.done process/grounding/factor/inf_istrue_relation_formation_global/materialize.done process/grounding/factor/inf_istrue_relation_formationtemporal/materialize.done process/grounding/factor/inf_istrue_relation_formationtemporal_global/materialize.done process/grounding/factor/inf_istrue_relation_taxonomy/materialize.done process/grounding/factor/inf_istrue_relation_taxonomy_global/materialize.done
	## process/grounding/global_weight_table #####################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/global_weight_table.reset:
	$(RESET) process/grounding/global_weight_table.done

process/grounding/factor/inf_istrue_entity_formation/assign_weight_id.done: process/grounding/weight_id_partition.done
	## process/grounding/factor/inf_istrue_entity_formation/assign_weight_id #####
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_formation/assign_weight_id.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_formation/assign_weight_id.done

process/grounding/factor/inf_istrue_entity_location/assign_weight_id.done: process/grounding/weight_id_partition.done
	## process/grounding/factor/inf_istrue_entity_location/assign_weight_id ######
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_location/assign_weight_id.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_location/assign_weight_id.done

process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id.done: process/grounding/weight_id_partition.done
	## process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id #########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id.done

process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id.done: process/grounding/weight_id_partition.done
	## process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id ######
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id.done

process/grounding/factor/inf_istrue_relation_formation/assign_weight_id.done: process/grounding/weight_id_partition.done
	## process/grounding/factor/inf_istrue_relation_formation/assign_weight_id ###
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formation/assign_weight_id.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formation/assign_weight_id.done

process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id.done: process/grounding/weight_id_partition.done
	## process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id.done

process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id.done: process/grounding/weight_id_partition.done
	## process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id.done

process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id.done: process/grounding/weight_id_partition.done
	## process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id.done

process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id.done: process/grounding/weight_id_partition.done
	## process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id ####
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id.done

process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id.done: process/grounding/weight_id_partition.done
	## process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id.done

process/grounding/factor/inf_istrue_entity_formation/dump.done: process/grounding/factor/inf_istrue_entity_formation/assign_weight_id.done
	## process/grounding/factor/inf_istrue_entity_formation/dump #################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_formation/dump.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_formation/dump.done

process/grounding/factor/inf_istrue_entity_location/dump.done: process/grounding/factor/inf_istrue_entity_location/assign_weight_id.done
	## process/grounding/factor/inf_istrue_entity_location/dump ##################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_location/dump.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_location/dump.done

process/grounding/factor/inf_istrue_entity_taxon/dump.done: process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id.done
	## process/grounding/factor/inf_istrue_entity_taxon/dump #####################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_taxon/dump.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_taxon/dump.done

process/grounding/factor/inf_istrue_entity_temporal/dump.done: process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id.done
	## process/grounding/factor/inf_istrue_entity_temporal/dump ##################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_temporal/dump.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_temporal/dump.done

process/grounding/factor/inf_istrue_relation_formation/dump.done: process/grounding/factor/inf_istrue_relation_formation/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_formation/dump ###############
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formation/dump.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formation/dump.done

process/grounding/factor/inf_istrue_relation_formation_global/dump.done: process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_formation_global/dump ########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formation_global/dump.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formation_global/dump.done

process/grounding/factor/inf_istrue_relation_formationtemporal/dump.done: process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_formationtemporal/dump #######
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formationtemporal/dump.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formationtemporal/dump.done

process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump.done: process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump.done

process/grounding/factor/inf_istrue_relation_taxonomy/dump.done: process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_taxonomy/dump ################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_taxonomy/dump.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_taxonomy/dump.done

process/grounding/factor/inf_istrue_relation_taxonomy_global/dump.done: process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_taxonomy_global/dump #########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_taxonomy_global/dump.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_taxonomy_global/dump.done

process/grounding/factor/inf_istrue_entity_formation/dump_weights.done: process/grounding/factor/inf_istrue_entity_formation/assign_weight_id.done
	## process/grounding/factor/inf_istrue_entity_formation/dump_weights #########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_formation/dump_weights.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_formation/dump_weights.done

process/grounding/factor/inf_istrue_entity_location/dump_weights.done: process/grounding/factor/inf_istrue_entity_location/assign_weight_id.done
	## process/grounding/factor/inf_istrue_entity_location/dump_weights ##########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_location/dump_weights.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_location/dump_weights.done

process/grounding/factor/inf_istrue_entity_taxon/dump_weights.done: process/grounding/factor/inf_istrue_entity_taxon/assign_weight_id.done
	## process/grounding/factor/inf_istrue_entity_taxon/dump_weights #############
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_taxon/dump_weights.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_taxon/dump_weights.done

process/grounding/factor/inf_istrue_entity_temporal/dump_weights.done: process/grounding/factor/inf_istrue_entity_temporal/assign_weight_id.done
	## process/grounding/factor/inf_istrue_entity_temporal/dump_weights ##########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_entity_temporal/dump_weights.reset:
	$(RESET) process/grounding/factor/inf_istrue_entity_temporal/dump_weights.done

process/grounding/factor/inf_istrue_relation_formation/dump_weights.done: process/grounding/factor/inf_istrue_relation_formation/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_formation/dump_weights #######
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formation/dump_weights.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formation/dump_weights.done

process/grounding/factor/inf_istrue_relation_formation_global/dump_weights.done: process/grounding/factor/inf_istrue_relation_formation_global/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_formation_global/dump_weights null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formation_global/dump_weights.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formation_global/dump_weights.done

process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights.done: process/grounding/factor/inf_istrue_relation_formationtemporal/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights.done

process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights.done: process/grounding/factor/inf_istrue_relation_formationtemporal_global/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights null
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights.done

process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights.done: process/grounding/factor/inf_istrue_relation_taxonomy/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights ########
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights.done

process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights.done: process/grounding/factor/inf_istrue_relation_taxonomy_global/assign_weight_id.done
	## process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights #
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights.reset:
	$(RESET) process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights.done

process/grounding/combine_factorgraph.done: process/grounding/factor/inf_istrue_entity_formation/dump.done process/grounding/factor/inf_istrue_entity_formation/dump_weights.done process/grounding/factor/inf_istrue_entity_location/dump.done process/grounding/factor/inf_istrue_entity_location/dump_weights.done process/grounding/factor/inf_istrue_entity_taxon/dump.done process/grounding/factor/inf_istrue_entity_taxon/dump_weights.done process/grounding/factor/inf_istrue_entity_temporal/dump.done process/grounding/factor/inf_istrue_entity_temporal/dump_weights.done process/grounding/factor/inf_istrue_relation_formation/dump.done process/grounding/factor/inf_istrue_relation_formation/dump_weights.done process/grounding/factor/inf_istrue_relation_formation_global/dump.done process/grounding/factor/inf_istrue_relation_formation_global/dump_weights.done process/grounding/factor/inf_istrue_relation_formationtemporal/dump.done process/grounding/factor/inf_istrue_relation_formationtemporal/dump_weights.done process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump.done process/grounding/factor/inf_istrue_relation_formationtemporal_global/dump_weights.done process/grounding/factor/inf_istrue_relation_taxonomy/dump.done process/grounding/factor/inf_istrue_relation_taxonomy/dump_weights.done process/grounding/factor/inf_istrue_relation_taxonomy_global/dump.done process/grounding/factor/inf_istrue_relation_taxonomy_global/dump_weights.done process/grounding/global_weight_table.done process/grounding/variable/entity_formation/dump.done process/grounding/variable/entity_location/dump.done process/grounding/variable/entity_taxon/dump.done process/grounding/variable/entity_temporal/dump.done process/grounding/variable/relation_formation/dump.done process/grounding/variable/relation_formation_global/dump.done process/grounding/variable/relation_formationtemporal/dump.done process/grounding/variable/relation_formationtemporal_global/dump.done process/grounding/variable/relation_taxonomy/dump.done process/grounding/variable/relation_taxonomy_global/dump.done
	## process/grounding/combine_factorgraph #####################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/grounding/combine_factorgraph.reset:
	$(RESET) process/grounding/combine_factorgraph.done

process/model/learning.done: model/factorgraph.done
	## process/model/learning ####################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/model/learning.reset:
	$(RESET) process/model/learning.done

process/model/inference.done: model/factorgraph.done model/weights.done
	## process/model/inference ###################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/model/inference.reset:
	$(RESET) process/model/inference.done

process/model/load_weights.done: model/weights.done
	## process/model/load_weights ################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/model/load_weights.reset:
	$(RESET) process/model/load_weights.done

process/model/load_probabilities.done: model/probabilities.done
	## process/model/load_probabilities ##########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/model/load_probabilities.reset:
	$(RESET) process/model/load_probabilities.done

process/model/calibration.done: data/model/probabilities.done
	## process/model/calibration #################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_process)
	$(TOUCH)
	##############################################################################

process/model/calibration.reset:
	$(RESET) process/model/calibration.done

data/all_entity_candidate.done: process/ext_all_entity_candidate.done
	## data/all_entity_candidate #################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/all_entity_candidate.reset:
	$(RESET) data/all_entity_candidate.done

data/all_entity_per_doc.done: process/ext_all_entity_per_doc.done
	## data/all_entity_per_doc ###################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/all_entity_per_doc.reset:
	$(RESET) data/all_entity_per_doc.done

data/document_with_all_entities.done: process/ext_document_with_all_entities.done
	## data/document_with_all_entities ###########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/document_with_all_entities.reset:
	$(RESET) data/document_with_all_entities.done

data/document_with_formation_entities.done: process/ext_document_with_formation_entities.done
	## data/document_with_formation_entities #####################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/document_with_formation_entities.reset:
	$(RESET) data/document_with_formation_entities.done

data/document_with_taxon_entities.done: process/ext_document_with_taxon_entities.done
	## data/document_with_taxon_entities #########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/document_with_taxon_entities.reset:
	$(RESET) data/document_with_taxon_entities.done

data/documents.done: process/ext_documents.done
	## data/documents ############################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/documents.reset:
	$(RESET) data/documents.done

data/documents_serialized.done: process/ext_documents_serialized.done
	## data/documents_serialized #################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/documents_serialized.reset:
	$(RESET) data/documents_serialized.done

data/entity_formation.done: process/ext_entity_formation.done
	## data/entity_formation #####################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_formation.reset:
	$(RESET) data/entity_formation.done

data/entity_formation_candidate.done: process/ext_entity_formation_candidate.done
	## data/entity_formation_candidate ###########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_formation_candidate.reset:
	$(RESET) data/entity_formation_candidate.done

data/entity_formation_candidate__0.done: process/ext_entity_formation_candidate__0_by_ext_entity_formation_global.done
	## data/entity_formation_candidate__0 ########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_formation_candidate__0.reset:
	$(RESET) data/entity_formation_candidate__0.done

data/entity_formation_candidate_local.done: process/ext_entity_formation_candidate_local_by_ext_entity_formation_local.done
	## data/entity_formation_candidate_local #####################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_formation_candidate_local.reset:
	$(RESET) data/entity_formation_candidate_local.done

data/entity_location.done: process/ext_entity_location.done
	## data/entity_location ######################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_location.reset:
	$(RESET) data/entity_location.done

data/entity_location_candidate.done: process/ext_entity_location_candidate_by_ext_entity_location_global.done
	## data/entity_location_candidate ############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_location_candidate.reset:
	$(RESET) data/entity_location_candidate.done

data/entity_taxon.done: process/ext_entity_taxon.done
	## data/entity_taxon #########################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_taxon.reset:
	$(RESET) data/entity_taxon.done

data/entity_taxon_candidate.done: process/ext_entity_taxon_candidate.done
	## data/entity_taxon_candidate ###############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_taxon_candidate.reset:
	$(RESET) data/entity_taxon_candidate.done

data/entity_taxon_candidate__0.done: process/ext_entity_taxon_candidate__0_by_ext_entity_taxon_global.done
	## data/entity_taxon_candidate__0 ############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_taxon_candidate__0.reset:
	$(RESET) data/entity_taxon_candidate__0.done

data/entity_taxon_candidate_local.done: process/ext_entity_taxon_candidate_local_by_ext_entity_taxon_local.done
	## data/entity_taxon_candidate_local #########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_taxon_candidate_local.reset:
	$(RESET) data/entity_taxon_candidate_local.done

data/entity_temporal.done: process/ext_entity_temporal.done
	## data/entity_temporal ######################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_temporal.reset:
	$(RESET) data/entity_temporal.done

data/entity_temporal_candidate.done: process/ext_entity_temporal_candidate_by_ext_entity_temporal_local.done
	## data/entity_temporal_candidate ############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/entity_temporal_candidate.reset:
	$(RESET) data/entity_temporal_candidate.done

data/formation_per_doc.done: process/ext_formation_per_doc.done
	## data/formation_per_doc ####################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/formation_per_doc.reset:
	$(RESET) data/formation_per_doc.done

data/model/probabilities.done: process/model/load_probabilities.done
	## data/model/probabilities ##################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/model/probabilities.reset:
	$(RESET) data/model/probabilities.done

data/model/weights.done: process/model/load_weights.done
	## data/model/weights ########################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/model/weights.reset:
	$(RESET) data/model/weights.done

data/relation_candidates.done: process/ext_relation_candidates_by_ext_relation_same_sent.done
	## data/relation_candidates ##################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/relation_candidates.reset:
	$(RESET) data/relation_candidates.done

data/relation_formation.done: process/ext_relation_formation.done
	## data/relation_formation ###################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/relation_formation.reset:
	$(RESET) data/relation_formation.done

data/relation_formation_global.done: process/ext_relation_formation_global.done
	## data/relation_formation_global ############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/relation_formation_global.reset:
	$(RESET) data/relation_formation_global.done

data/relation_formation_supervise.done: process/ext_relation_formation_supervise_by_ext_relation_variable_formation.done
	## data/relation_formation_supervise #########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/relation_formation_supervise.reset:
	$(RESET) data/relation_formation_supervise.done

data/relation_formationtemporal.done: process/ext_relation_formationtemporal.done
	## data/relation_formationtemporal ###########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/relation_formationtemporal.reset:
	$(RESET) data/relation_formationtemporal.done

data/relation_formationtemporal_global.done: process/ext_relation_formationtemporal_global.done
	## data/relation_formationtemporal_global ####################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/relation_formationtemporal_global.reset:
	$(RESET) data/relation_formationtemporal_global.done

data/relation_formationtemporal_supervise.done: process/ext_relation_formationtemporal_supervise_by_ext_relation_variable_formationtemporal.done
	## data/relation_formationtemporal_supervise #################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/relation_formationtemporal_supervise.reset:
	$(RESET) data/relation_formationtemporal_supervise.done

data/relation_taxonomy.done: process/ext_relation_taxonomy.done
	## data/relation_taxonomy ####################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/relation_taxonomy.reset:
	$(RESET) data/relation_taxonomy.done

data/relation_taxonomy_global.done: process/ext_relation_taxonomy_global.done
	## data/relation_taxonomy_global #############################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/relation_taxonomy_global.reset:
	$(RESET) data/relation_taxonomy_global.done

data/relation_taxonomy_supervise.done: process/ext_relation_taxonomy_supervise_by_ext_relation_variable_taxonomy.done
	## data/relation_taxonomy_supervise ##########################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/relation_taxonomy_supervise.reset:
	$(RESET) data/relation_taxonomy_supervise.done

data/sentences.done: process/ext_sentences.done
	## data/sentences ############################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/sentences.reset:
	$(RESET) data/sentences.done

data/sentences_original.done: process/init/relation/sentences_original.done
	## data/sentences_original ###################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/sentences_original.reset:
	$(RESET) data/sentences_original.done

data/sentences_serialized.done: process/ext_sentences_serialized.done
	## data/sentences_serialized #################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/sentences_serialized.reset:
	$(RESET) data/sentences_serialized.done

data/taxon_per_doc.done: process/ext_taxon_per_doc.done
	## data/taxon_per_doc ########################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_data)
	$(TOUCH)
	##############################################################################

data/taxon_per_doc.reset:
	$(RESET) data/taxon_per_doc.done

model/calibration-plots.done: process/model/calibration.done
	## model/calibration-plots ###################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_model)
	$(TOUCH)
	##############################################################################

model/calibration-plots.reset:
	$(RESET) model/calibration-plots.done

model/factorgraph.done: process/grounding/combine_factorgraph.done
	## model/factorgraph #########################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_model)
	$(TOUCH)
	##############################################################################

model/factorgraph.reset:
	$(RESET) model/factorgraph.done

model/probabilities.done: process/model/inference.done
	## model/probabilities #######################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_model)
	$(TOUCH)
	##############################################################################

model/probabilities.reset:
	$(RESET) model/probabilities.done

model/weights.done: process/model/learning.done
	## model/weights #############################################################
	# Done: $(shell format_timestamp $@ $@~ 2>/dev/null)
	$(CMD_model)
	$(TOUCH)
	##############################################################################

model/weights.reset:
	$(RESET) model/weights.done

